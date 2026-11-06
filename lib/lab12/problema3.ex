defmodule Lab12.Problema3 do
  @moduledoc """
  Problema 3: calcular la transpuesta de una matriz definida como lista de
  listas, usando funciones lambda. La salida tambien es lista de listas.
  """

  @doc """
  Devuelve la transpuesta de `matriz`.

  La idea es recorrer los indices de columna y, para cada uno, armar con una
  lambda la lista de los valores que ocupan esa posicion en cada fila. Esa
  columna de la matriz original pasa a ser una fila de la transpuesta.

      iex> Lab12.Problema3.transponer([[1, 2], [3, 4]])
      [[1, 3], [2, 4]]
  """
  def transponer([]), do: []

  def transponer([primera_fila | _] = matriz) when is_list(matriz) do
    ultima_columna = length(primera_fila) - 1

    Enum.map(0..ultima_columna//1, fn columna ->
      Enum.map(matriz, fn fila -> Enum.at(fila, columna) end)
    end)
  end
end
