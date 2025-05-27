defmodule Polarex.Generated.S3FileCreatePart do
  @moduledoc """
  Provides struct and type for a S3FileCreatePart
  """

  @type t :: %__MODULE__{
          checksum_sha2_56_base6_4: String.t() | nil,
          chunk_end: integer,
          chunk_start: integer,
          number: integer
        }

  defstruct [:checksum_sha2_56_base6_4, :chunk_end, :chunk_start, :number]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checksum_sha2_56_base6_4: {:union, [{:string, :generic}, :null]},
      chunk_end: :integer,
      chunk_start: :integer,
      number: :integer
    ]
  end
end
