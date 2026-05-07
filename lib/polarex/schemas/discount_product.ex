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
          metadata: map,
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t(),
          recurring_interval: String.t() | nil,
          recurring_interval_count: integer | nil,
          trial_interval: String.t() | nil,
          trial_interval_count: integer | nil,
          visibility: String.t()
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
      created_at: {:string, "date-time"},
      description: {:union, [:string, :null]},
      id: {:string, "uuid4"},
      is_archived: :boolean,
      is_recurring: :boolean,
      metadata: :map,
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"},
      recurring_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      recurring_interval_count: {:union, [:integer, :null]},
      trial_interval: {:union, [{:enum, ["day", "week", "month", "year"]}, :null]},
      trial_interval_count: {:union, [:integer, :null]},
      visibility: {:enum, ["draft", "private", "public"]}
    ]
  end
end
