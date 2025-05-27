# config/config.exs

import Config

config :oapi_generator,
  default: [
    output: [
      base_module: Polarex,
      location: "lib/polarex"
    ]
  ]
