import Config

if Mix.env() == :dev do
  config :oapi_generator,
    default: [
      output: [
        field_casing: :snake,
        base_module: Polarex,
        default_client: Polarex.Support.Client,
        location: "lib/polarex",
        operation_subdirectory: "/operations/",
        schema_subdirectory: "/schemas/"
      ]
    ]
end

if Mix.env() in [:dev, :test] do
  config :polarex, server: "https://sandbox-api.polar.sh", access_token: ""
end
