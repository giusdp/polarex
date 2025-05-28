defmodule Polarex.S3DownloadURL do
  @moduledoc """
  Provides struct and type for a S3DownloadURL
  """

  @type t :: %__MODULE__{
          expires_at: DateTime.t(),
          headers: Polarex.Headers.t() | nil,
          url: String.t()
        }

  defstruct [:expires_at, :headers, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expires_at: {:string, :date_time}, headers: {Polarex.Headers, :t}, url: {:string, :generic}]
  end
end
