defmodule Polarex.CheckoutOrganization do
  @moduledoc """
  Provides struct and type for a CheckoutOrganization
  """

  @type t :: %__MODULE__{
          allow_customer_updates: boolean,
          avatar_url: String.t() | nil,
          created_at: DateTime.t(),
          id: String.t(),
          modified_at: DateTime.t() | nil,
          name: String.t(),
          proration_behavior: String.t(),
          slug: String.t()
        }

  defstruct [
    :allow_customer_updates,
    :avatar_url,
    :created_at,
    :id,
    :modified_at,
    :name,
    :proration_behavior,
    :slug
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_customer_updates: :boolean,
      avatar_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      id: {:string, :generic},
      modified_at: {:union, [{:string, :date_time}, :null]},
      name: {:string, :generic},
      proration_behavior: {:enum, ["invoice", "prorate"]},
      slug: {:string, :generic}
    ]
  end
end
