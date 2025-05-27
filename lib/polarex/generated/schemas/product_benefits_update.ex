defmodule Polarex.Generated.ProductBenefitsUpdate do
  @moduledoc """
  Provides struct and type for a ProductBenefitsUpdate
  """

  @type t :: %__MODULE__{benefits: [String.t()]}

  defstruct [:benefits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [benefits: [string: :generic]]
  end
end
