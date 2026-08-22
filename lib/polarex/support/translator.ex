defmodule Polarex.Support.Translator do
  @moduledoc """
  This module's purpose is to automatically translate each response type from the generated API.
  It exposes a single function called `translate` that receives the type and the value to parse.
  """

  def translate(_, nil), do: nil
  def translate(nil, body), do: body
  def translate(:map, body), do: body
  def translate([:map], body), do: body
  def translate(:string, body), do: body
  def translate({:string, :generic}, body), do: body
  def translate({:string, :date_time}, body), do: parse_datetime!(body)
  def translate({:string, "date-time"}, body), do: parse_datetime!(body)
  def translate({:string, "date"}, body), do: Date.from_iso8601!(body)
  def translate({:string, _format}, body), do: body
  def translate(:boolean, body), do: body
  def translate(:integer, body) when is_binary(body), do: String.to_integer(body)
  def translate(:integer, body), do: body
  def translate(:number, body), do: body
  def translate(:unknown, body), do: body
  def translate({:const, value}, _body), do: value
  def translate([const: value], body), do: translate({:const, value}, body)
  def translate([string: format], body), do: translate({:string, format}, body)
  def translate([union: types], body), do: translate({:union, types}, body)

  def translate({:enum, _values}, body), do: body

  def translate({:union, [type, :null]}, body), do: translate(type, body)

  def translate({:union, types}, body) do
    type = Enum.find(types, &matches_type?(&1, body)) || List.first(types)

    translate(type, body)
  end

  def translate({_module, :t}, body) when map_size(body) == 0, do: %{}

  # Explicitly handle Polarex.Metadata as a special case cause it's an empty struct but in
  # reality it is a map with custom fields.
  def translate({Polarex.Metadata, :t}, body), do: body

  def translate({module, :t}, body) do
    fields = module.__fields__(:t)

    translated =
      Map.new(fields, fn
        {field, type} ->
          case get_field(body, field) do
            nil -> {field, nil}
            item -> {field, translate_field(type, item)}
          end
      end)

    struct!(module, translated)
  end

  def translate([type], body) when is_list(body) do
    Enum.map(body, &translate(type, &1))
  end

  def translate(type, _body) do
    raise("Response translation not implemented: #{inspect(type)}")
  end

  defp translate_field([{module, type}], items) when is_list(items) do
    Enum.map(items, &translate({module, type}, &1))
  end

  defp translate_field(type, item), do: translate(type, item)

  defp matches_type?(:null, body), do: is_nil(body)
  defp matches_type?(:map, body), do: is_map(body)
  defp matches_type?(:string, body), do: is_binary(body)
  defp matches_type?({:string, _format}, body), do: is_binary(body)
  defp matches_type?(:boolean, body), do: is_boolean(body)
  defp matches_type?(:integer, body), do: is_integer(body)
  defp matches_type?(:number, body), do: is_number(body)
  defp matches_type?(:unknown, _body), do: true
  defp matches_type?({:enum, values}, body), do: body in values
  defp matches_type?({:const, value}, body), do: body == value
  defp matches_type?([const: value], body), do: matches_type?({:const, value}, body)
  defp matches_type?([string: format], body), do: matches_type?({:string, format}, body)
  defp matches_type?([union: types], body), do: matches_type?({:union, types}, body)

  defp matches_type?([type], body),
    do: is_list(body) and Enum.all?(body, &matches_type?(type, &1))

  defp matches_type?({:union, types}, body), do: Enum.any?(types, &matches_type?(&1, body))

  defp matches_type?({module, :t}, body) when is_atom(module) and is_map(body) do
    case module.__fields__(:t)[:type] do
      {:const, type} -> body["type"] == type
      _other -> true
    end
  end

  defp matches_type?(_type, _body), do: false

  defp parse_datetime!(body) do
    case DateTime.from_iso8601(body) do
      {:ok, datetime, _offset} -> datetime
      {:error, _reason} -> NaiveDateTime.from_iso8601!(body)
    end
  end

  # Get the camel-case version of the field from the API payload
  # so we can properly map to the internal Elixir representation.
  defp get_field(body, field), do: body[Atom.to_string(field)]
end
