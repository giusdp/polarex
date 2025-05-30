defmodule Polarex.Support.Translator do
  @moduledoc """
  This module's purpose is to automatically translate each response type from the generated API.
  It exposes a single function called `translate` that receives the type and the value to parse.
  """

  def translate(_, nil), do: nil
  def translate(nil, body), do: body
  def translate(:map, body), do: body
  def translate([:map], body), do: body
  def translate({:string, :generic}, body), do: body
  def translate(:boolean, body), do: body
  def translate(:integer, body) when is_binary(body), do: String.to_integer(body)
  def translate(:integer, body), do: body
  def translate({:string, :date_time}, body), do: NaiveDateTime.from_iso8601!(body)
  def translate({:const, value}, _body), do: value

  def translate({:enum, _values}, body), do: body

  def translate({:union, [type, :null]}, body), do: translate(type, body)

  def translate({:union, types}, body) do
    actual_module =
      types
      |> Enum.find(fn {module, :t} ->
        {:const, custom_name} = module.__fields__(:t)[:type]
        %{"type" => actual_type} = body
        custom_name == actual_type
      end)

    translate(actual_module, body)
  end

  def translate({_module, :t}, body) when map_size(body) == 0, do: %{}

  # Explicitly handle Polarex.Metadata as a special case cause it's an empty struct but in
  # reality it is a map with custom fields.
  def translate({Polarex.Metadata, :t}, body), do: body

  def translate({module, :t}, body) do
    fields = module.__fields__(:t)

    translated =
      Map.new(fields, fn
        {field, {module, type}} ->
          item = get_field(body, field)
          translated = translate({module, type}, item)
          {field, translated}

        {field, [{module, type}]} ->
          items = get_field(body, field)
          translated = Enum.map(items, &translate({module, type}, &1))
          {field, translated}

        {field, type} ->
          item = get_field(body, field)
          translated = translate(type, item)
          {field, translated}
      end)

    struct!(module, translated)
  end

  def translate(type, _body) do
    raise("Response translation not implemented: #{inspect(type)}")
  end

  # Get the camel-case version of the field from the API payload
  # so we can properly map to the internal Elixir representation.
  defp get_field(body, field), do: body[Atom.to_string(field)]
end
