defmodule Polarex.Generated.S3FileCreateMultipart do
  @moduledoc """
  Provides struct and type for a S3FileCreateMultipart
  """

  @type t :: %__MODULE__{parts: [Polarex.Generated.S3FileCreatePart.t()]}

  defstruct [:parts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parts: [{Polarex.Generated.S3FileCreatePart, :t}]]
  end
end
