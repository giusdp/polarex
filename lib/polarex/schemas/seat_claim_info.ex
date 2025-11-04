defmodule Polarex.SeatClaimInfo do
  @moduledoc """
  Provides struct and type for a SeatClaimInfo
  """

  @type t :: %__MODULE__{
          can_claim: boolean,
          customer_email: String.t(),
          organization_name: String.t(),
          organization_slug: String.t(),
          product_id: String.t(),
          product_name: String.t()
        }

  defstruct [
    :can_claim,
    :customer_email,
    :organization_name,
    :organization_slug,
    :product_id,
    :product_name
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_claim: :boolean,
      customer_email: {:string, :generic},
      organization_name: {:string, :generic},
      organization_slug: {:string, :generic},
      product_id: {:string, :uuid},
      product_name: {:string, :generic}
    ]
  end
end
