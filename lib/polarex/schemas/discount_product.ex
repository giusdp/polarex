defmodule Polarex.DiscountProduct do
  @moduledoc """
  Provides struct and type for a DiscountProduct
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          is_archived: boolean,
          is_recurring: boolean,
          metadata: Polarex.Metadata.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          recurring_interval: String.t() | nil
        }

  defstruct [
    :created_at,
    :description,
    :id,
    :is_archived,
    :is_recurring,
    :metadata,
    :modified_at,
    :name,
    :organization_id,
    :recurring_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      is_archived: :boolean,
      is_recurring: :boolean,
      metadata: {Polarex.Metadata, :t},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      recurring_interval: {:union, [{:enum, ["month", "year"]}, :null]}
    ]
  end
end
