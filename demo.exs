# Corrida de los tres problemas con los ejemplos del enunciado.
# Uso: mix run demo.exs

defmodule Demo do
  def titulo(texto) do
    IO.puts("")
    IO.puts(texto)
    IO.puts(String.duplicate("-", String.length(texto)))
  end

  def diccionarios(lista) do
    IO.puts("[")

    Enum.each(lista, fn d ->
      IO.puts("  %{make: #{inspect(d.make)}, model: #{d.model}, color: #{inspect(d.color)}}")
    end)

    IO.puts("]")
  end

  def matriz(filas) do
    Enum.each(filas, fn fila ->
      IO.puts("  " <> Enum.map_join(fila, "  ", &String.pad_leading(to_string(&1), 2)))
    end)
  end
end

telefonos = [
  %{make: "Nokia", model: 216, color: "Black"},
  %{make: "Mi Max", model: 2, color: "Gold"},
  %{make: "Samsung", model: 7, color: "Blue"}
]

Demo.titulo("Problema 2: ordenar diccionarios por key")
IO.puts("Lista original:")
Demo.diccionarios(telefonos)
IO.puts("")
IO.puts("Ordenada con key = :model")
Demo.diccionarios(Lab12.Problema2.ordenar(telefonos, :model))
IO.puts("")
IO.puts("Ordenada con key = :make")
Demo.diccionarios(Lab12.Problema2.ordenar(telefonos, :make))

x = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

Demo.titulo("Problema 3: matriz transpuesta")
IO.puts("Matriz X:")
Demo.matriz(x)
IO.puts("")
IO.puts("Transpuesta X^T:")
Demo.matriz(Lab12.Problema3.transponer(x))
IO.puts("")
IO.puts("Como lista de listas:")
IO.puts("  " <> inspect(Lab12.Problema3.transponer(x)))
IO.puts("")
IO.puts("Tambien funciona con una matriz rectangular 2x3:")
IO.puts("  " <> inspect([[1, 2, 3], [4, 5, 6]]))
IO.puts("  " <> inspect(Lab12.Problema3.transponer([[1, 2, 3], [4, 5, 6]])))

colores = ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]
a_borrar = ["amarillo", "cafe", "blanco"]

Demo.titulo("Problema 4: eliminar elementos de una lista")
IO.puts("Lista inicial:")
IO.puts("  " <> inspect(colores))
IO.puts("Elementos a borrar:")
IO.puts("  " <> inspect(a_borrar))
IO.puts("Resultado:")
IO.puts("  " <> inspect(Lab12.Problema4.eliminar(colores, a_borrar)))
IO.puts("")
IO.puts(~s(Nota: "cafe" no estaba en la lista, por eso se ignora.))
IO.puts("")
