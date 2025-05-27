defmodule Polarex.Generated.ProductMediaFileCreate do
  @moduledoc """
  Provides struct and type for a ProductMediaFileCreate
  """

  @type t :: %__MODULE__{
          checksum_sha2_56_base6_4: String.t() | nil,
          mime_type: String.t(),
          name: String.t(),
          organization_id: String.t() | nil,
          service: String.t(),
          size: integer,
          upload: Polarex.Generated.S3FileCreateMultipart.t(),
          version: String.t() | nil
        }

  defstruct [
    :checksum_sha2_56_base6_4,
    :mime_type,
    :name,
    :organization_id,
    :service,
    :size,
    :upload,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checksum_sha2_56_base6_4: {:union, [{:string, :generic}, :null]},
      mime_type: {:string, :generic},
      name: {:string, :generic},
      organization_id: {:union, [{:string, :generic}, :null]},
      service: {:const, "product_media"},
      size: :integer,
      upload: {Polarex.Generated.S3FileCreateMultipart, :t},
      version: {:union, [{:string, :generic}, :null]}
    ]
  end
end
