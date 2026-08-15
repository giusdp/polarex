defmodule Polarex.CustomerStateIndividual do
  @moduledoc """
  Provides struct and type for a CustomerStateIndividual
  """

  @type t :: %__MODULE__{
          active_meters: [Polarex.CustomerStateMeter.t()],
          active_subscriptions: [Polarex.CustomerStateSubscription.t()],
          avatar_url: String.t() | nil,
          billing_address: Polarex.Address.t() | nil,
          billing_name: String.t() | nil,
          created_at: DateTime.t(),
          default_payment_method_id: String.t() | nil,
          deleted_at: DateTime.t() | nil,
          email: String.t(),
          email_verified: boolean,
          external_id: String.t() | nil,
          first_user_event_at: DateTime.t() | nil,
          granted_benefits: [Polarex.CustomerStateBenefitGrant.t()],
          id: String.t(),
          locale: String.t() | nil,
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          organization_id: String.t(),
          tax_id: [any] | nil,
          type: String.t()
        }

  defstruct [
    :active_meters,
    :active_subscriptions,
    :avatar_url,
    :billing_address,
    :billing_name,
    :created_at,
    :default_payment_method_id,
    :deleted_at,
    :email,
    :email_verified,
    :external_id,
    :first_user_event_at,
    :granted_benefits,
    :id,
    :locale,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :tax_id,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_meters: [{Polarex.CustomerStateMeter, :t}],
      active_subscriptions: [{Polarex.CustomerStateSubscription, :t}],
      avatar_url: {:union, [:string, :null]},
      billing_address: {:union, [{Polarex.Address, :t}, :null]},
      billing_name: {:union, [:string, :null]},
      created_at: {:string, "date-time"},
      default_payment_method_id: {:union, [{:string, "uuid4"}, :null]},
      deleted_at: {:union, [{:string, "date-time"}, :null]},
      email: :string,
      email_verified: :boolean,
      external_id: {:union, [:string, :null]},
      first_user_event_at: {:union, [{:string, "date-time"}, :null]},
      granted_benefits: [{Polarex.CustomerStateBenefitGrant, :t}],
      id: {:string, "uuid4"},
      locale: {:union, [:string, :null]},
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: {:union, [:string, :null]},
      organization_id: {:string, "uuid4"},
      tax_id: {:union, [[:unknown], :null]},
      type: {:const, "individual"}
    ]
  end
end
