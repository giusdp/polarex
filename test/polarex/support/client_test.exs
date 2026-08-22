defmodule Polarex.Support.ClientTest do
  use ExUnit.Case, async: false

  setup do
    Application.put_env(:polarex, :req_options, plug: {Req.Test, Polarex})
    on_exit(fn -> Application.delete_env(:polarex, :req_options) end)
  end

  test "executes operations through req_options and returns typed structs" do
    Req.Test.expect(Polarex, fn conn ->
      assert conn.method == "GET"
      assert conn.request_path == "/v1/products/"

      Req.Test.json(conn, %{"items" => [], "pagination" => %{"total_count" => 0, "max_page" => 0}})
    end)

    assert {:ok, %Polarex.ListResourceProduct{items: [], pagination: %Polarex.Pagination{total_count: 0}}} =
             Polarex.Products.products_list([])
  end

  test "per-call req_options win over the application environment" do
    Application.put_env(:polarex, :req_options, plug: {Req.Test, UnusedPlug})

    Req.Test.expect(Polarex, fn conn ->
      Req.Test.json(conn, %{"items" => [], "pagination" => %{"total_count" => 0, "max_page" => 0}})
    end)

    assert {:ok, _list} = Polarex.Products.products_list(req_options: [plug: {Req.Test, Polarex}])
  end

  test "does not retry mutating requests" do
    Req.Test.expect(Polarex, fn conn ->
      conn |> Plug.Conn.put_status(500) |> Req.Test.json(%{})
    end)

    assert {:error, "HTTP response status: 500"} =
             Polarex.Customers.customers_create(%Polarex.CustomerTeamCreate{type: "team"})
  end

  test "emits telemetry with the operation" do
    ref = :telemetry_test.attach_event_handlers(self(), [[:polarex, :request, :stop]])

    Req.Test.expect(Polarex, fn conn ->
      Req.Test.json(conn, %{"items" => [], "pagination" => %{"total_count" => 0, "max_page" => 0}})
    end)

    Polarex.Products.products_list([])

    assert_received {[:polarex, :request, :stop], ^ref, %{duration: _},
                     %{operation: {Polarex.Products, :products_list}, method: :get}}
  end
end
