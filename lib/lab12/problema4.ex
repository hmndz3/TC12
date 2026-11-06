defmodule Lab12.Problema4 do
  @moduledoc """
  Problema 4: eliminar de una lista los elementos indicados en otra lista,
  usando funciones lambda.
  """

  @doc """
  Devuelve los elementos de `lista` que no aparecen en `a_borrar`.

  La lambda `fn elemento -> elemento in a_borrar end` es la prueba que decide
  que se va; `Enum.reject/2` deja pasar lo demas. Si en `a_borrar` viene algo
  que no estaba en la lista original, simplemente no afecta el resultado.

      iex> Lab12.Problema4.eliminar(["rojo", "verde"], ["verde", "cafe"])
      ["rojo"]
  """
  def eliminar(lista, a_borrar) when is_list(lista) and is_list(a_borrar) do
    Enum.reject(lista, fn elemento -> elemento in a_borrar end)
  end
end
