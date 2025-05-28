defmodule Polarex.CustomFields do
  @moduledoc """
  Provides API endpoints related to custom fields
  """

  @default_client Polarex.Support.Client

  @doc """
  Create Custom Field

  Create a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_create(
          Polarex.CustomFieldCreateCheckbox.t()
          | Polarex.CustomFieldCreateDate.t()
          | Polarex.CustomFieldCreateNumber.t()
          | Polarex.CustomFieldCreateSelect.t()
          | Polarex.CustomFieldCreateText.t(),
          keyword
        ) ::
          {:ok,
           Polarex.CustomFieldCheckbox.t()
           | Polarex.CustomFieldDate.t()
           | Polarex.CustomFieldNumber.t()
           | Polarex.CustomFieldSelect.t()
           | Polarex.CustomFieldText.t()}
          | {:error, Polarex.HTTPValidationError.t()}
  def custom_fields_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.CustomFields, :custom_fields_create},
      url: "/v1/custom-fields/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomFieldCreateCheckbox, :t},
            {Polarex.CustomFieldCreateDate, :t},
            {Polarex.CustomFieldCreateNumber, :t},
            {Polarex.CustomFieldCreateSelect, :t},
            {Polarex.CustomFieldCreateText, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.CustomFieldCheckbox, :t},
            {Polarex.CustomFieldDate, :t},
            {Polarex.CustomFieldNumber, :t},
            {Polarex.CustomFieldSelect, :t},
            {Polarex.CustomFieldText, :t}
          ]}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Custom Field

  Delete a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_delete(String.t(), keyword) ::
          :ok | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def custom_fields_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomFields, :custom_fields_delete},
      url: "/v1/custom-fields/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Custom Field

  Get a custom field by ID.

  **Scopes**: `custom_fields:read` `custom_fields:write`
  """
  @spec custom_fields_get(String.t(), keyword) ::
          {:ok,
           Polarex.CustomFieldCheckbox.t()
           | Polarex.CustomFieldDate.t()
           | Polarex.CustomFieldNumber.t()
           | Polarex.CustomFieldSelect.t()
           | Polarex.CustomFieldText.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def custom_fields_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.CustomFields, :custom_fields_get},
      url: "/v1/custom-fields/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomFieldCheckbox, :t},
            {Polarex.CustomFieldDate, :t},
            {Polarex.CustomFieldNumber, :t},
            {Polarex.CustomFieldSelect, :t},
            {Polarex.CustomFieldText, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List Custom Fields

  List custom fields.

  **Scopes**: `custom_fields:read` `custom_fields:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `query`: Filter by custom field name or slug.
    * `type`: Filter by custom field type.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.
    * `sorting`: Sorting criterion. Several criteria can be used simultaneously and will be applied in order. Add a minus sign `-` before the criteria name to sort by descending order.

  """
  @spec custom_fields_list(keyword) ::
          {:ok, Polarex.ListResourceCustomField.t()} | {:error, Polarex.HTTPValidationError.t()}
  def custom_fields_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting, :type])

    client.request(%{
      args: [],
      call: {Polarex.CustomFields, :custom_fields_list},
      url: "/v1/custom-fields/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.ListResourceCustomField, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Custom Field

  Update a custom field.

  **Scopes**: `custom_fields:write`
  """
  @spec custom_fields_update(
          String.t(),
          Polarex.CustomFieldUpdateCheckbox.t()
          | Polarex.CustomFieldUpdateDate.t()
          | Polarex.CustomFieldUpdateNumber.t()
          | Polarex.CustomFieldUpdateSelect.t()
          | Polarex.CustomFieldUpdateText.t(),
          keyword
        ) ::
          {:ok,
           Polarex.CustomFieldCheckbox.t()
           | Polarex.CustomFieldDate.t()
           | Polarex.CustomFieldNumber.t()
           | Polarex.CustomFieldSelect.t()
           | Polarex.CustomFieldText.t()}
          | {:error, Polarex.HTTPValidationError.t() | Polarex.ResourceNotFound.t()}
  def custom_fields_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.CustomFields, :custom_fields_update},
      url: "/v1/custom-fields/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.CustomFieldUpdateCheckbox, :t},
            {Polarex.CustomFieldUpdateDate, :t},
            {Polarex.CustomFieldUpdateNumber, :t},
            {Polarex.CustomFieldUpdateSelect, :t},
            {Polarex.CustomFieldUpdateText, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.CustomFieldCheckbox, :t},
            {Polarex.CustomFieldDate, :t},
            {Polarex.CustomFieldNumber, :t},
            {Polarex.CustomFieldSelect, :t},
            {Polarex.CustomFieldText, :t}
          ]}},
        {404, {Polarex.ResourceNotFound, :t}},
        {422, {Polarex.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end
