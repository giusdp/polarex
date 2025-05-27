defmodule Polarex.Generated.CustomFields do
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
          Polarex.Generated.CustomFieldCreateCheckbox.t()
          | Polarex.Generated.CustomFieldCreateDate.t()
          | Polarex.Generated.CustomFieldCreateNumber.t()
          | Polarex.Generated.CustomFieldCreateSelect.t()
          | Polarex.Generated.CustomFieldCreateText.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.CustomFieldCheckbox.t()
           | Polarex.Generated.CustomFieldDate.t()
           | Polarex.Generated.CustomFieldNumber.t()
           | Polarex.Generated.CustomFieldSelect.t()
           | Polarex.Generated.CustomFieldText.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def custom_fields_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.CustomFields, :custom_fields_create},
      url: "/v1/custom-fields/",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomFieldCreateCheckbox, :t},
            {Polarex.Generated.CustomFieldCreateDate, :t},
            {Polarex.Generated.CustomFieldCreateNumber, :t},
            {Polarex.Generated.CustomFieldCreateSelect, :t},
            {Polarex.Generated.CustomFieldCreateText, :t}
          ]}}
      ],
      response: [
        {201,
         {:union,
          [
            {Polarex.Generated.CustomFieldCheckbox, :t},
            {Polarex.Generated.CustomFieldDate, :t},
            {Polarex.Generated.CustomFieldNumber, :t},
            {Polarex.Generated.CustomFieldSelect, :t},
            {Polarex.Generated.CustomFieldText, :t}
          ]}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def custom_fields_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CustomFields, :custom_fields_delete},
      url: "/v1/custom-fields/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
           Polarex.Generated.CustomFieldCheckbox.t()
           | Polarex.Generated.CustomFieldDate.t()
           | Polarex.Generated.CustomFieldNumber.t()
           | Polarex.Generated.CustomFieldSelect.t()
           | Polarex.Generated.CustomFieldText.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def custom_fields_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.CustomFields, :custom_fields_get},
      url: "/v1/custom-fields/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.CustomFieldCheckbox, :t},
            {Polarex.Generated.CustomFieldDate, :t},
            {Polarex.Generated.CustomFieldNumber, :t},
            {Polarex.Generated.CustomFieldSelect, :t},
            {Polarex.Generated.CustomFieldText, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          {:ok, Polarex.Generated.ListResourceCustomField.t()}
          | {:error, Polarex.Generated.HTTPValidationError.t()}
  def custom_fields_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :organization_id, :page, :query, :sorting, :type])

    client.request(%{
      args: [],
      call: {Polarex.Generated.CustomFields, :custom_fields_list},
      url: "/v1/custom-fields/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceCustomField, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
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
          Polarex.Generated.CustomFieldUpdateCheckbox.t()
          | Polarex.Generated.CustomFieldUpdateDate.t()
          | Polarex.Generated.CustomFieldUpdateNumber.t()
          | Polarex.Generated.CustomFieldUpdateSelect.t()
          | Polarex.Generated.CustomFieldUpdateText.t(),
          keyword
        ) ::
          {:ok,
           Polarex.Generated.CustomFieldCheckbox.t()
           | Polarex.Generated.CustomFieldDate.t()
           | Polarex.Generated.CustomFieldNumber.t()
           | Polarex.Generated.CustomFieldSelect.t()
           | Polarex.Generated.CustomFieldText.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def custom_fields_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.CustomFields, :custom_fields_update},
      url: "/v1/custom-fields/#{id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Polarex.Generated.CustomFieldUpdateCheckbox, :t},
            {Polarex.Generated.CustomFieldUpdateDate, :t},
            {Polarex.Generated.CustomFieldUpdateNumber, :t},
            {Polarex.Generated.CustomFieldUpdateSelect, :t},
            {Polarex.Generated.CustomFieldUpdateText, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Polarex.Generated.CustomFieldCheckbox, :t},
            {Polarex.Generated.CustomFieldDate, :t},
            {Polarex.Generated.CustomFieldNumber, :t},
            {Polarex.Generated.CustomFieldSelect, :t},
            {Polarex.Generated.CustomFieldText, :t}
          ]}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end
