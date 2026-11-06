defmodule Lab12.Problema4Test do
  use ExUnit.Case, async: true
  doctest Lab12.Problema4

  alias Lab12.Problema4

  @colores ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]

  test "elimina los colores del ejemplo e ignora el que no estaba" do
    assert Problema4.eliminar(@colores, ["amarillo", "cafe", "blanco"]) ==
             ["rojo", "verde", "azul", "gris", "negro"]
  end

  test "si no hay nada que borrar la lista no cambia" do
    assert Problema4.eliminar(@colores, []) == @colores
  end

  test "ninguno de los elementos a borrar estaba en la lista" do
    assert Problema4.eliminar(@colores, ["cafe", "rosado"]) == @colores
  end

  test "borrar todo deja la lista vacia" do
    assert Problema4.eliminar(@colores, @colores) == []
  end

  test "borra todas las repeticiones de un elemento" do
    assert Problema4.eliminar(["a", "b", "a", "c", "a"], ["a"]) == ["b", "c"]
  end

  test "respeta el orden de los que quedan" do
    assert Problema4.eliminar([1, 2, 3, 4, 5], [2, 4]) == [1, 3, 5]
  end

  test "sirve con numeros y atomos" do
    assert Problema4.eliminar([1, :dos, "tres"], [:dos]) == [1, "tres"]
  end

  test "una lista vacia se queda vacia" do
    assert Problema4.eliminar([], ["rojo"]) == []
  end
end
