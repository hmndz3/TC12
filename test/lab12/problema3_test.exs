defmodule Lab12.Problema3Test do
  use ExUnit.Case, async: true
  doctest Lab12.Problema3

  alias Lab12.Problema3

  test "transpone la matriz 3x3 del enunciado" do
    x = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    assert Problema3.transponer(x) == [
             [1, 4, 7],
             [2, 5, 8],
             [3, 6, 9]
           ]
  end

  test "transpone una matriz rectangular" do
    assert Problema3.transponer([[1, 2, 3], [4, 5, 6]]) == [[1, 4], [2, 5], [3, 6]]
  end

  test "transponer dos veces devuelve la matriz original" do
    x = [[1, 2, 3], [4, 5, 6]]
    assert x |> Problema3.transponer() |> Problema3.transponer() == x
  end

  test "una sola fila se vuelve una columna" do
    assert Problema3.transponer([[1, 2, 3]]) == [[1], [2], [3]]
  end

  test "una sola columna se vuelve una fila" do
    assert Problema3.transponer([[1], [2], [3]]) == [[1, 2, 3]]
  end

  test "sirve con valores que no son numeros" do
    assert Problema3.transponer([["a", "b"], ["c", "d"]]) == [["a", "c"], ["b", "d"]]
  end

  test "una matriz vacia da una matriz vacia" do
    assert Problema3.transponer([]) == []
  end

  test "una fila vacia no genera columnas" do
    assert Problema3.transponer([[]]) == []
  end
end
