defmodule Polarex.Generated.Files do
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
          Polarex.Generated.DownloadableFileCreate.t()
          | Polarex.Generated.OrganizationAvatarFileCreate.t()
          | Polarex.Generated.ProductMediaFileCreate.t(),
          keyword
        ) ::
          {:ok, Polarex.Generated.FileUpload.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def files_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.Files, :files_create},
      url: "/v1/files/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.DownloadableFileCreate, :t},
            {Polarex.Generated.OrganizationAvatarFileCreate, :t},
            {Polarex.Generated.ProductMediaFileCreate, :t}
          ]}}
      ],
      response: [
        {201, {Polarex.Generated.FileUpload, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
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
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def files_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.Files, :files_delete},
      url: "/v1/files/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.ListResourceFileRead.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def files_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:ids, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.Files, :files_list},
      url: "/v1/files/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceFileRead, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update File

  Update a file.

  **Scopes**: `files:write`
  """
  @spec files_update(String.t(), Polarex.Generated.FilePatch.t(), keyword) ::
          {:ok,
           Polarex.Generated.DownloadableFileRead.t()
           | Polarex.Generated.OrganizationAvatarFileRead.t()
           | Polarex.Generated.ProductMediaFileRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def files_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Files, :files_update},
      url: "/v1/files/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.FilePatch, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DownloadableFileRead, :t},
            {Polarex.Generated.OrganizationAvatarFileRead, :t},
            {Polarex.Generated.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Complete File Upload

  Complete a file upload.

  **Scopes**: `files:write`
  """
  @spec files_uploaded(String.t(), Polarex.Generated.FileUploadCompleted.t(), keyword) ::
          {:ok,
           Polarex.Generated.DownloadableFileRead.t()
           | Polarex.Generated.OrganizationAvatarFileRead.t()
           | Polarex.Generated.ProductMediaFileRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def files_uploaded(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.Files, :files_uploaded},
      url: "/v1/files/#{id}/uploaded",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.FileUploadCompleted, :t}}],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.DownloadableFileRead, :t},
            {Polarex.Generated.OrganizationAvatarFileRead, :t},
            {Polarex.Generated.ProductMediaFileRead, :t}
          ]}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end
