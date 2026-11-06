defmodule Lab12.Problema2 do
  @moduledoc """
  Problema 2: ordenar una lista de diccionarios (mapas) respecto a un key
  indicado, usando funciones lambda.
  """

  @doc """
  Devuelve la lista ordenada de menor a mayor segun el valor que cada mapa
  guarda en `key`.

  La lambda `fn diccionario -> ... end` es la que decide con que valor se
  compara cada elemento; `Enum.sort_by/2` solo se encarga del acomodo.

      iex> Lab12.Problema2.ordenar([%{model: 216}, %{model: 2}], :model)
      [%{model: 2}, %{model: 216}]
  """
  def ordenar(lista, key) when is_list(lista) do
    Enum.sort_by(lista, fn diccionario -> Map.fetch!(diccionario, key) end)
  end

  @doc """
  Igual que `ordenar/2` pero de mayor a menor.
  """
  def ordenar_desc(lista, key) when is_list(lista) do
    Enum.sort_by(lista, fn diccionario -> Map.fetch!(diccionario, key) end, :desc)
  end
end
