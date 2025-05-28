defmodule Polarex.Files do
  @moduledoc """
  Provides API endpoints related to files
  """

  @default_client Polarex.Support.Client

  @doc """
  Create File

  Create a file.

  **Scopes**: `files:write`
  """
  @spec files_create(
          Polarex.DownloadableFileCreate.t()
          | Polarex.OrganizationAvatarFileCreate.t()
          | Polarex.ProductMediaFileCreate.t(),
          keyword
        ) :: {:ok, Polarex.FileUpload.t()} | {:error, Polarex.HTTPValidationError.t()}
  def files_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Files, :files_create},
      url: "/v1/files/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.DownloadableFileCreate, :t},
            {Polarex.OrganizationAvatarFileCreate, :t},
            {Polarex.ProductMediaFileCreate, :t}
          ]}}
      ],
      response: [{201, {Polarex.FileUpload, :t}}, {422, {Polarex.HTTPValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete File

  Delete a file.

  **Scopes**: `files:write`
  """
  @spec files_delete(String.t(), keyword) ::
          :ok
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def files_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Files, :files_delete},
      url: "/v1/files/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Files

  List files.

  **Scopes**: `files:read` `files:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `ids`: Filter by file ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec files_list(keyword) ::
          {:ok, Polarex.ListResourceFileRead.t()} | {:error, Polarex.HTTPValidationError.t()}
  def files_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Files, :files_list},
      url: "/v1/files/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceFileRead, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update File

  Update a file.

  **Scopes**: `files:write`
  """
  @spec files_update(String.t(), Polarex.FilePatch.t(), keyword) ::
          {:ok,
           Polarex.DownloadableFileRead.t()
           | Polarex.OrganizationAvatarFileRead.t()
           | Polarex.ProductMediaFileRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def files_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Files, :files_update},
      url: "/v1/files/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.FilePatch, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.DownloadableFileRead, :t},
            {Polarex.OrganizationAvatarFileRead, :t},
            {Polarex.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Complete File Upload

  Complete a file upload.

  **Scopes**: `files:write`
  """
  @spec files_uploaded(String.t(), Polarex.FileUploadCompleted.t(), keyword) ::
          {:ok,
           Polarex.DownloadableFileRead.t()
           | Polarex.OrganizationAvatarFileRead.t()
           | Polarex.ProductMediaFileRead.t()}
          | {:error,
             Polarex.HTTPValidationError.t()
             | Polarex.NotPermitted.t()
             | Polarex.ResourceNotFound.t()}
  def files_uploaded(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Files, :files_uploaded},
      url: "/v1/files/#{id}/uploaded",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.FileUploadCompleted, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.DownloadableFileRead, :t},
            {Polarex.OrganizationAvatarFileRead, :t},
            {Polarex.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.NotPermitted, :t}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end
