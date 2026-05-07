defmodule Polarex.CustomerSubscriptionProduct do
  @moduledoc """
  Provides struct and type for a CustomerSubscriptionProduct
  """

  @type t :: %__MODULE__{
          benefits: [Polarex.BenefitPublic.t()],
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          is_archived: boolean,
          is_recurring: boolean,
          medias: [Polarex.ProductMediaFileRead.t()],
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization: Polarex.CustomerOrganization.t(),
          organization_id: String.t(),
          prices: [map],
          recurring_interval: String.t() | nil,
          recurring_interval_count: integer | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil,
          visibility: String.t()
        }

  defstruct [
    :benefits,
    :created_at,
    :description,
    :id,
    :is_archived,
    :is_recurring,
    :medias,
    :modified_at,
    :name,
    :organization,
    :organization_id,
    :prices,
    :recurring_interval,
    :recurring_interval_count,
    :trial_interval,
    :trial_interval_count,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefits: [{Polarex.BenefitPublic, :t}],
      created_at: {:string, "date-time"},
      description: {:union, [:string, :null]},
      id: {:string, "uuid4"},
      is_archived: :boolean,
      is_recurring: :boolean,
      medias: [{Polarex.ProductMediaFileRead, :t}],
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization: {Polarex.CustomerOrganization, :t},
      organization_id: {:string, "uuid4"},
      prices: [:map],
      recurring_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      recurring_interval_count: {:union, [:integer, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      visibility: {:enum, ["draft", "private", "public"]}
    ]
  end
end
