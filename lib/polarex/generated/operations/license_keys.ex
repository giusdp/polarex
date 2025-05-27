defmodule Polarex.Generated.LicenseKeys do
  @moduledoc """
  Provides API endpoints related to license keys
  """

  @default_client Polarex.Support.Client

  @doc """
  Activate License Key

  Activate a license key instance.
  """
  @spec customer_portal_license_keys_activate(Polarex.Generated.LicenseKeyActivate.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.NotPermitted.t()
             | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_activate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.LicenseKeys, :customer_portal_license_keys_activate},
      url: "/v1/customer-portal/license-keys/activate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.LicenseKeyActivate, :t}}],
      response: [
        {200, {Polarex.Generated.LicenseKeyActivationRead, :t}},
        {403, {Polarex.Generated.NotPermitted, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Deactivate License Key

  Deactivate a license key instance.
  """
  @spec customer_portal_license_keys_deactivate(
          Polarex.Generated.LicenseKeyDeactivate.t(),
          keyword
        ) ::
          :ok
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_deactivate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.LicenseKeys, :customer_portal_license_keys_deactivate},
      url: "/v1/customer-portal/license-keys/deactivate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.LicenseKeyDeactivate, :t}}],
      response: [
        {204, :null},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get License Key

  Get a license key.

  **Scopes**: `customer_portal:read` `customer_portal:write`
  """
  @spec customer_portal_license_keys_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyWithActivations.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.LicenseKeys, :customer_portal_license_keys_get},
      url: "/v1/customer-portal/license-keys/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.LicenseKeyWithActivations, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List License Keys

  **Scopes**: `customer_portal:read` `customer_portal:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `benefit_id`: Filter by a specific benefit
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec customer_portal_license_keys_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceLicenseKeyRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def customer_portal_license_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.LicenseKeys, :customer_portal_license_keys_list},
      url: "/v1/customer-portal/license-keys/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceLicenseKeyRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Validate License Key

  Validate a license key.
  """
  @spec customer_portal_license_keys_validate(Polarex.Generated.LicenseKeyValidate.t(), keyword) ::
          {:ok, Polarex.Generated.ValidatedLicenseKey.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t() | Polarex.Generated.ResourceNotFound.t()}
  def customer_portal_license_keys_validate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Polarex.Generated.LicenseKeys, :customer_portal_license_keys_validate},
      url: "/v1/customer-portal/license-keys/validate",
      body: body,
      method: :post,
      request: [{"application/json", {Polarex.Generated.LicenseKeyValidate, :t}}],
      response: [
        {200, {Polarex.Generated.ValidatedLicenseKey, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get License Key

  Get a license key.

  **Scopes**: `license_keys:read` `license_keys:write`
  """
  @spec license_keys_get(String.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyWithActivations.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Polarex.Generated.LicenseKeys, :license_keys_get},
      url: "/v1/license-keys/#{id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.LicenseKeyWithActivations, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Activation

  Get a license key activation.

  **Scopes**: `license_keys:read` `license_keys:write`
  """
  @spec license_keys_get_activation(String.t(), String.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyActivationRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_get_activation(id, activation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, activation_id: activation_id],
      call: {Polarex.Generated.LicenseKeys, :license_keys_get_activation},
      url: "/v1/license-keys/#{id}/activations/#{activation_id}",
      method: :get,
      response: [
        {200, {Polarex.Generated.LicenseKeyActivationRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List License Keys

  Get license keys connected to the given organization & filters.

  **Scopes**: `license_keys:read` `license_keys:write`

  ## Options

    * `organization_id`: Filter by organization ID.
    * `benefit_id`: Filter by benefit ID.
    * `page`: Page number, defaults to 1.
    * `limit`: Size of a page, defaults to 10. Maximum is 100.

  """
  @spec license_keys_list(keyword) ::
          {:ok, Polarex.Generated.ListResourceLicenseKeyRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:benefit_id, :limit, :organization_id, :page])

    client.request(%{
      args: [],
      call: {Polarex.Generated.LicenseKeys, :license_keys_list},
      url: "/v1/license-keys/",
      method: :get,
      query: query,
      response: [
        {200, {Polarex.Generated.ListResourceLicenseKeyRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update License Key

  Update a license key.

  **Scopes**: `license_keys:write`
  """
  @spec license_keys_update(String.t(), Polarex.Generated.LicenseKeyUpdate.t(), keyword) ::
          {:ok, Polarex.Generated.LicenseKeyRead.t()}
          | {:error,
             Polarex.Generated.HTTPValidationError.t()
             | Polarex.Generated.ResourceNotFound.t()
             | Polarex.Generated.Unauthorized.t()}
  def license_keys_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Polarex.Generated.LicenseKeys, :license_keys_update},
      url: "/v1/license-keys/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Polarex.Generated.LicenseKeyUpdate, :t}}],
      response: [
        {200, {Polarex.Generated.LicenseKeyRead, :t}},
        {401, {Polarex.Generated.Unauthorized, :t}},
        {404, {Polarex.Generated.ResourceNotFound, :t}},
        {422, {Polarex.Generated.HTTPValidationError, :t}}
      ],
      opts: opts
    })
  end
end
