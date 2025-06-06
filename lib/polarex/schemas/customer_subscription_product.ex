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
          organization: Polarex.Organization.t(),
          organization_id: String.t(),
          prices: [map],
          recurring_interval: String.t() | nil
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
    :recurring_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefits: [{Polarex.BenefitPublic, :t}],
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      is_archived: :boolean,
      is_recurring: :boolean,
      medias: [{Polarex.ProductMediaFileRead, :t}],
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization: {Polarex.Organization, :t},
      organization_id: {:string, :generic},
      prices: [:map],
      recurring_interval: {:union, [{:enum, ["month", "year"]}, :null]}
    ]
  end
end
