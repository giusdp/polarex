defmodule Polarex.Generated.CheckoutProduct do
  @moduledoc """
  Provides struct and type for a CheckoutProduct
  """

  @type t :: %__MODULE__{
          benefits: [Polarex.Generated.BenefitPublic.t()],
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          is_archived: boolean,
          is_recurring: boolean,
          medias: [Polarex.Generated.ProductMediaFileRead.t()],
          modified_at: DateTime.t() | nil,
          name: String.t(),
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
    :organization_id,
    :prices,
    :recurring_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefits: [{Polarex.Generated.BenefitPublic, :t}],
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      is_archived: :boolean,
      is_recurring: :boolean,
      medias: [{Polarex.Generated.ProductMediaFileRead, :t}],
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      prices: [:map],
      recurring_interval: {:union, [{:enum, ["month", "year"]}, :null]}
    ]
  end
end
