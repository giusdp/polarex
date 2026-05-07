defmodule Polarex.MetricDashboardSchema do
  @moduledoc """
  Provides struct and type for a MetricDashboardSchema
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          metrics: [String.t()],
          modified_at: DateTime.t() | nil,
          name: String.t(),
          organization_id: String.t()
        }

  defstruct [:created_at, :id, :metrics, :modified_at, :name, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      id: {:string, "uuid4"},
      metrics: [:string],
      modified_at: {:union, [{:string, "date-time"}, :null]},
      name: :string,
      organization_id: {:string, "uuid4"}
    ]
  end
end
