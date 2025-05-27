import Config

if Mix.env() == :dev do
  config :oapi_generator,
    default: [
      field_casing: :snake,
      output: [
        base_module: Polarex.Generated,
        default_client: Polarex.Support.Client,
        location: "lib/polarex",
        operation_subdirectory: "generated/operations/",
        schema_subdirectory: "generated/schemas/"
      ]
    ]
end

if Mix.env() in [:dev, :test] do
  config :polarex, server: "sandbox"
end
