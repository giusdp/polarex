defmodule Polarex.Generated.S3FileUploadPart do
  @moduledoc """
  Provides struct and type for a S3FileUploadPart
  """

  @type t :: %__MODULE__{
          checksum_sha2_56_base6_4: String.t() | nil,
          chunk_end: integer,
          chunk_start: integer,
          expires_at: DateTime.t(),
          headers: Polarex.Generated.Headers.t() | nil,
          number: integer,
          url: String.t()
        }

  defstruct [
    :checksum_sha2_56_base6_4,
    :chunk_end,
    :chunk_start,
    :expires_at,
    :headers,
    :number,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checksum_sha2_56_base6_4: {:union, [{:string, :generic}, :null]},
      chunk_end: :integer,
      chunk_start: :integer,
      expires_at: {:string, :date_time},
      headers: {Polarex.Generated.Headers, :t},
      number: :integer,
      url: {:string, :generic}
    ]
  end
end
