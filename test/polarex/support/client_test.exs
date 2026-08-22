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

    assert {:ok,
            %Polarex.ListResourceProduct{
              items: [],
              pagination: %Polarex.Pagination{total_count: 0}
            }} =
             Polarex.Products.products_list([])
  end

  test "per-call req_options win over the application environment" do
    Application.put_env(:polarex, :req_options, plug: {Req.Test, UnusedPlug})

    Req.Test.expect(Polarex, fn conn ->
      Req.Test.json(conn, %{"items" => [], "pagination" => %{"total_count" => 0, "max_page" => 0}})
    end)

    assert {:ok, _list} = Polarex.Products.products_list(req_options: [plug: {Req.Test, Polarex}])
  end

  test "does not retry mutating requests and returns a typed error" do
    Req.Test.expect(Polarex, fn conn ->
      conn |> Plug.Conn.put_status(500) |> Req.Test.json(%{})
    end)

    assert {:error, %Polarex.Error{status: 500, message: "HTTP response status: 500"}} =
             Polarex.Customers.customers_create(%Polarex.CustomerTeamCreate{type: "team"})
  end

  test "decodes validation errors on 422" do
    Req.Test.expect(Polarex, fn conn ->
      conn
      |> Plug.Conn.put_status(422)
      |> Req.Test.json(%{
        "detail" => [
          %{
            "loc" => ["body", "email"],
            "msg" => "value is not a valid email",
            "type" => "value_error"
          }
        ]
      })
    end)

    assert {:error, %Polarex.Error{status: 422, validation_errors: [error]}} =
             Polarex.Customers.customers_create(%Polarex.CustomerTeamCreate{type: "team"})

    assert %Polarex.ValidationError{loc: ["body", "email"], msg: "value is not a valid email"} =
             error
  end

  test "treats empty success bodies as ok" do
    Req.Test.expect(Polarex, fn conn ->
      Plug.Conn.send_resp(conn, 204, "")
    end)

    assert {:ok, nil} = Polarex.Customers.customers_delete("cus-1")
  end

  test "encodes nested structs in request bodies" do
    Req.Test.expect(Polarex, fn conn ->
      {:ok, body, conn} = Plug.Conn.read_body(conn)

      assert JSON.decode!(body) == %{
               "type" => "team",
               "owner" => %{"email" => "owner@example.com"}
             }

      Req.Test.json(conn, %{"message" => "irrelevant"})
    end)

    Polarex.Customers.customers_create(%Polarex.CustomerTeamCreate{
      type: "team",
      owner: %Polarex.MemberOwnerCreate{email: "owner@example.com"}
    })
  end

  test "wraps transport errors" do
    Req.Test.expect(Polarex, &Req.Test.transport_error(&1, :econnrefused))

    assert {:error, %Polarex.Error{status: nil, reason: :econnrefused}} =
             Polarex.Products.products_list(req_options: [retry: false])
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
