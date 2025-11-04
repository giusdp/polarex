defmodule Polarex.LLMMetadata do
  @moduledoc """
  Provides struct and type for a LLMMetadata
  """

  @type t :: %__MODULE__{
          cached_input_tokens: integer | nil,
          input_tokens: integer,
          model: String.t(),
          output_tokens: integer,
          prompt: String.t() | nil,
          response: String.t() | nil,
          total_tokens: integer,
          vendor: String.t()
        }

  defstruct [
    :cached_input_tokens,
    :input_tokens,
    :model,
    :output_tokens,
    :prompt,
    :response,
    :total_tokens,
    :vendor
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cached_input_tokens: :integer,
      input_tokens: :integer,
      model: {:string, :generic},
      output_tokens: :integer,
      prompt: {:union, [{:string, :generic}, :null]},
      response: {:union, [{:string, :generic}, :null]},
      total_tokens: :integer,
      vendor: {:string, :generic}
    ]
  end
end
