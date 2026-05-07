defmodule Polarex.MetricDashboardCreate do
  @moduledoc """
  Provides struct and type for a MetricDashboardCreate
  """

  @type t :: %__MODULE__{
          metrics: [String.t()] | nil,
          name: String.t(),
          organization_id: String.t() | nil
        }

  defstruct [:metrics, :name, :organization_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metrics: [:string], name: :string, organization_id: {:union, [{:string, "uuid4"}, :null]}]
  end
end
