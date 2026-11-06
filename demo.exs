# Corrida de los problemas con los ejemplos del enunciado.
#
#   mix run demo.exs      -> corre los tres
#   mix run demo.exs 3    -> corre solo el problema 3

defmodule Demo do
  @telefonos [
    %{make: "Nokia", model: 216, color: "Black"},
    %{make: "Mi Max", model: 2, color: "Gold"},
    %{make: "Samsung", model: 7, color: "Blue"}
  ]

  @matriz [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

  @colores ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]
  @a_borrar ["amarillo", "cafe", "blanco"]

  def correr([]), do: correr(["2", "3", "4"])

  def correr(problemas), do: Enum.each(problemas, &problema/1)

  defp problema("2") do
    titulo("Problema 2: ordenar diccionarios por key")
    IO.puts("Lista original:")
    diccionarios(@telefonos)
    IO.puts("")
    IO.puts("Ordenada con key = :model")
    diccionarios(Lab12.Problema2.ordenar(@telefonos, :model))
    IO.puts("")
    IO.puts("Ordenada con key = :make")
    diccionarios(Lab12.Problema2.ordenar(@telefonos, :make))
    IO.puts("")
  end

  defp problema("3") do
    titulo("Problema 3: matriz transpuesta")
    IO.puts("Matriz X:")
    matriz(@matriz)
    IO.puts("")
    IO.puts("Transpuesta X^T:")
    matriz(Lab12.Problema3.transponer(@matriz))
    IO.puts("")
    IO.puts("Como lista de listas:")
    IO.puts("  " <> inspect(Lab12.Problema3.transponer(@matriz)))
    IO.puts("")
    IO.puts("Tambien sirve con una matriz rectangular 2x3:")
    IO.puts("  " <> inspect([[1, 2, 3], [4, 5, 6]]))
    IO.puts("  " <> inspect(Lab12.Problema3.transponer([[1, 2, 3], [4, 5, 6]])))
    IO.puts("")
  end

  defp problema("4") do
    titulo("Problema 4: eliminar elementos de una lista")
    IO.puts("Lista inicial:")
    IO.puts("  " <> inspect(@colores))
    IO.puts("Elementos a borrar:")
    IO.puts("  " <> inspect(@a_borrar))
    IO.puts("Resultado:")
    IO.puts("  " <> inspect(Lab12.Problema4.eliminar(@colores, @a_borrar)))
    IO.puts("")
    IO.puts(~s(Nota: "cafe" no estaba en la lista, por eso se ignora.))
    IO.puts("")
  end

  defp problema(otro) do
    IO.puts(~s(No hay un problema "#{otro}" en este demo. Use 2, 3 o 4.))
  end

  defp titulo(texto) do
    IO.puts("")
    IO.puts(texto)
    IO.puts(String.duplicate("-", String.length(texto)))
  end

  defp diccionarios(lista) do
    IO.puts("[")

    Enum.each(lista, fn d ->
      IO.puts("  %{make: #{inspect(d.make)}, model: #{d.model}, color: #{inspect(d.color)}}")
    end)

    IO.puts("]")
  end

  defp matriz(filas) do
    Enum.each(filas, fn fila ->
      IO.puts("  " <> Enum.map_join(fila, "  ", &String.pad_leading(to_string(&1), 2)))
    end)
  end
end

Demo.correr(System.argv())
