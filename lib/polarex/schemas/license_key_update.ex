defmodule Polarex.LicenseKeyUpdate do
  @moduledoc """
  Provides struct and type for a LicenseKeyUpdate
  """

  @type t :: %__MODULE__{
          expires_at: DateTime.t() | nil,
          limit_activations: integer | nil,
          limit_usage: integer | nil,
          status: String.t() | nil,
          usage: integer | nil
        }

  defstruct [:expires_at, :limit_activations, :limit_usage, :status, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_at: {:union, [{:string, :date_time}, :null]},
      limit_activations: {:union, [:integer, :null]},
      limit_usage: {:union, [:integer, :null]},
      status: {:union, [{:enum, ["granted", "revoked", "disabled"]}, :null]},
      usage: :integer
    ]
  end
end
