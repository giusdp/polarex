defmodule Polarex.FileDownload do
  @moduledoc """
  Provides struct and type for a FileDownload
  """

  @type t :: %__MODULE__{
          checksum_etag: String.t() | nil,
          checksum_sha2_56_base6_4: String.t() | nil,
          checksum_sha2_56_hex: String.t() | nil,
          download: Polarex.S3DownloadURL.t(),
          id: String.t(),
          is_uploaded: boolean,
          last_modified_at: DateTime.t() | nil,
          mime_type: String.t(),
          name: String.t(),
          organization_id: String.t(),
          path: String.t(),
          service: String.t(),
          size: integer,
          size_readable: String.t(),
          storage_version: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :checksum_etag,
    :checksum_sha2_56_base6_4,
    :checksum_sha2_56_hex,
    :download,
    :id,
    :is_uploaded,
    :last_modified_at,
    :mime_type,
    :name,
    :organization_id,
    :path,
    :service,
    :size,
    :size_readable,
    :storage_version,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checksum_etag: {:union, [:string, :null]},
      checksum_sha2_56_base6_4: {:union, [:string, :null]},
      checksum_sha2_56_hex: {:union, [:string, :null]},
      download: {Polarex.S3DownloadURL, :t},
      id: {:string, "uuid4"},
      is_uploaded: :boolean,
      last_modified_at: {:union, [{:string, "date-time"}, :null]},
      mime_type: :string,
      name: :string,
      organization_id: {:string, "uuid4"},
      path: :string,
      service:
        {:enum,
         ["downloadable", "product_media", "organization_avatar", "support_case_attachment"]},
      size: :integer,
      size_readable: :string,
      storage_version: {:union, [:string, :null]},
      version: {:union, [:string, :null]}
    ]
  end
end
