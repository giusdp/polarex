defmodule Polarex.Support.TranslatorTest do
  use ExUnit.Case, async: true

  alias Polarex.Support.Translator

  test "translates formatted strings and primitive fields in customer sessions" do
    body = %{
      "created_at" => "2026-05-10T19:32:13.184053Z",
      "customer" => %{
        "avatar_url" => "https://example.com/avatar.png",
        "billing_address" => %{
          "city" => nil,
          "country" => "IT",
          "line1" => nil,
          "line2" => nil,
          "postal_code" => nil,
          "state" => nil
        },
        "created_at" => "2026-05-09T14:10:24.985549Z",
        "deleted_at" => nil,
        "email" => "customer@example.com",
        "email_verified" => false,
        "external_id" => "external-id",
        "id" => "89bc5782-b584-471f-a5f0-2ce26047f33e",
        "locale" => "en",
        "metadata" => %{},
        "modified_at" => "2026-05-09T14:10:29.364267Z",
        "name" => "Customer Name",
        "organization_id" => "c47af799-caf4-43a4-901a-bd32bf71dd91",
        "tax_id" => nil,
        "type" => "individual"
      },
      "customer_id" => "89bc5782-b584-471f-a5f0-2ce26047f33e",
      "customer_portal_url" => "https://sandbox.polar.sh/example/portal",
      "expires_at" => "2026-05-10T20:32:13.184031Z",
      "id" => "85b0375b-2095-4f0e-b1c7-d208f8051f0a",
      "modified_at" => nil,
      "return_url" => nil,
      "token" => "polar_mst_token"
    }

    assert %Polarex.CustomerSession{} =
             session = Translator.translate({Polarex.CustomerSession, :t}, body)

    assert session.created_at == ~U[2026-05-10 19:32:13.184053Z]
    assert session.customer_id == "89bc5782-b584-471f-a5f0-2ce26047f33e"
    assert session.customer.email == "customer@example.com"
    assert session.customer.billing_address.country == "IT"
    assert session.modified_at == nil
  end

  test "translates unions containing primitive map types" do
    body = %{
      "active_meters" => [],
      "active_subscriptions" => [
        %{
          "amount" => 2000,
          "cancel_at_period_end" => true,
          "canceled_at" => "2026-05-09T14:29:10.235820Z",
          "created_at" => "2026-05-09T14:10:28.707658Z",
          "currency" => "eur",
          "current_period_end" => "2027-05-09T14:10:28.701323Z",
          "current_period_start" => "2026-05-09T14:10:28.701323Z",
          "custom_field_data" => %{},
          "discount_id" => nil,
          "ends_at" => "2027-05-09T14:10:28.701323Z",
          "id" => "e2fb48ef-d9af-4023-a6ae-72fb7eb60d09",
          "metadata" => %{},
          "meters" => [],
          "modified_at" => "2026-05-09T14:29:10.239153Z",
          "product_id" => "b59fd96f-f1be-4aed-bb3e-dfa102a90503",
          "recurring_interval" => "year",
          "started_at" => "2026-05-09T14:10:28.701323Z",
          "status" => "active",
          "trial_end" => nil,
          "trial_start" => nil
        }
      ],
      "avatar_url" => "https://example.com/avatar.png",
      "billing_address" => nil,
      "created_at" => "2026-05-09T14:10:24.985549Z",
      "deleted_at" => nil,
      "email" => "customer@example.com",
      "email_verified" => false,
      "external_id" => "external-id",
      "granted_benefits" => [
        %{
          "benefit_id" => "07c91483-2730-4087-a2b4-09c981c7597f",
          "benefit_metadata" => %{},
          "benefit_type" => "feature_flag",
          "created_at" => "2026-05-09T14:10:29.801382Z",
          "granted_at" => "2026-05-09T14:10:29.800317Z",
          "id" => "de3087a0-6f51-4e08-9caa-1c1edc115e2d",
          "modified_at" => nil,
          "properties" => %{}
        }
      ],
      "id" => "77bc5782-b564-471f-a5f0-2ce26047f33e",
      "locale" => "en",
      "metadata" => %{},
      "modified_at" => "2026-05-09T14:10:29.364267Z",
      "name" => "Customer Name",
      "organization_id" => "c47ff799-caf4-43a4-901a-bd32bf71dd91",
      "tax_id" => nil,
      "type" => "individual"
    }

    assert %Polarex.CustomerStateIndividual{} =
             customer =
             Translator.translate({Polarex.CustomerStateIndividual, :t}, body)

    assert [%Polarex.CustomerStateSubscription{}] = customer.active_subscriptions

    assert customer.active_subscriptions |> hd() |> Map.fetch!(:ends_at) ==
             ~U[2027-05-09 14:10:28.701323Z]

    assert [%Polarex.CustomerStateBenefitGrant{properties: %{}}] = customer.granted_benefits
  end
end
