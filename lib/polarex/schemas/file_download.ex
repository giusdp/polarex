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
      checksum_etag: {:union, [{:string, :generic}, :null]},
      checksum_sha2_56_base6_4: {:union, [{:string, :generic}, :null]},
      checksum_sha2_56_hex: {:union, [{:string, :generic}, :null]},
      download: {Polarex.S3DownloadURL, :t},
      id: {:string, :generic},
      is_uploaded: :boolean,
      last_modified_at: {:union, [{:string, :date_time}, :null]},
      mime_type: {:string, :generic},
      name: {:string, :generic},
      organization_id: {:string, :generic},
      path: {:string, :generic},
      service: {:enum, ["downloadable", "product_media", "organization_avatar"]},
      size: :integer,
      size_readable: {:string, :generic},
      storage_version: {:union, [{:string, :generic}, :null]},
      version: {:union, [{:string, :generic}, :null]}
    ]
  end
end
