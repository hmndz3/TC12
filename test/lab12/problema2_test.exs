defmodule Lab12.Problema2Test do
  use ExUnit.Case, async: true
  doctest Lab12.Problema2

  alias Lab12.Problema2

  @telefonos [
    %{make: "Nokia", model: 216, color: "Black"},
    %{make: "Mi Max", model: 2, color: "Gold"},
    %{make: "Samsung", model: 7, color: "Blue"}
  ]

  test "ordena por model igual que el ejemplo del enunciado" do
    assert Problema2.ordenar(@telefonos, :model) == [
             %{make: "Mi Max", model: 2, color: "Gold"},
             %{make: "Samsung", model: 7, color: "Blue"},
             %{make: "Nokia", model: 216, color: "Black"}
           ]
  end

  test "ordena por un key de texto" do
    assert Enum.map(Problema2.ordenar(@telefonos, :make), & &1.make) ==
             ["Mi Max", "Nokia", "Samsung"]
  end

  test "ordena de mayor a menor" do
    assert Enum.map(Problema2.ordenar_desc(@telefonos, :model), & &1.model) == [216, 7, 2]
  end

  test "tambien sirve con keys de texto en lugar de atomos" do
    lista = [%{"nota" => 90}, %{"nota" => 60}]
    assert Problema2.ordenar(lista, "nota") == [%{"nota" => 60}, %{"nota" => 90}]
  end

  test "una lista vacia se queda vacia" do
    assert Problema2.ordenar([], :model) == []
  end

  test "un solo diccionario se devuelve tal cual" do
    assert Problema2.ordenar([%{model: 5}], :model) == [%{model: 5}]
  end

  test "mantiene el orden original cuando el key empata" do
    lista = [%{make: "A", model: 1}, %{make: "B", model: 1}]
    assert Enum.map(Problema2.ordenar(lista, :model), & &1.make) == ["A", "B"]
  end

  test "falla claro si algun diccionario no tiene el key" do
    assert_raise KeyError, fn -> Problema2.ordenar([%{make: "Nokia"}], :model) end
  end
end
