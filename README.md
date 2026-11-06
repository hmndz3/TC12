# Laboratorio 12 - Teoría de la computación

Harry Méndez · Noviembre 2025

Los ejercicios de programación de este laboratorio están resueltos en **Elixir**,
que es un lenguaje funcional y no es Python, como pedía el enunciado. Todo se
resuelve con funciones lambda (`fn ... end`) pasadas a funciones de orden
superior del módulo `Enum`.

## Video

Ejecución del programa: [ver en YouTube](PENDIENTE_LINK_YOUTUBE)

## Contenido del repositorio

- `problema1/` — respuestas escritas a mano del problema 1, en PDF.
- `lib/lab12/problema2.ex` — ordenar una lista de diccionarios por un key.
- `lib/lab12/problema3.ex` — transpuesta de una matriz.
- `lib/lab12/problema4.ex` — eliminar elementos indicados de una lista.
- `test/` — pruebas de los tres problemas con ExUnit.
- `demo.exs` — corrida de los tres problemas con los ejemplos del enunciado.

## Cómo correrlo

Hace falta tener Elixir instalado (`elixir --version`).

Para ver la corrida completa:

```bash
mix run demo.exs
```

Para correr un solo problema:

```bash
mix run demo.exs 3
```

Para correr las pruebas:

```bash
mix test
```

Para probar a mano en la consola interactiva:

```bash
iex -S mix
```

```elixir
Lab12.Problema2.ordenar([%{make: "Nokia", model: 216}, %{make: "Mi Max", model: 2}], :model)
Lab12.Problema3.transponer([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
Lab12.Problema4.eliminar(["rojo", "verde", "azul"], ["verde", "cafe"])
```

## Problema 2: ordenar una lista de diccionarios

El criterio de orden va en una lambda que, dado un diccionario, devuelve el
valor guardado en el key indicado. `Enum.sort_by/2` usa ese valor para acomodar
la lista.

```elixir
def ordenar(lista, key) do
  Enum.sort_by(lista, fn diccionario -> Map.fetch!(diccionario, key) end)
end
```

Con la lista del enunciado y `key = :model`, la salida queda `2, 7, 216`. También
hay una versión de mayor a menor (`ordenar_desc/2`) y funciona igual si los keys
son texto en lugar de átomos.

## Problema 3: matriz transpuesta

Se recorren los índices de columna y, para cada uno, una lambda arma la lista de
los valores que ocupan esa posición en todas las filas. Cada columna de la
matriz original termina siendo una fila de la transpuesta.

```elixir
def transponer([primera_fila | _] = matriz) do
  ultima_columna = length(primera_fila) - 1

  Enum.map(0..ultima_columna//1, fn columna ->
    Enum.map(matriz, fn fila -> Enum.at(fila, columna) end)
  end)
end
```

Sirve con matrices cuadradas y rectangulares, y transponer dos veces devuelve la
matriz original.

## Problema 4: eliminar elementos de una lista

La lambda es la prueba que decide qué se va: si el elemento aparece en la lista
de borrados, `Enum.reject/2` lo saca.

```elixir
def eliminar(lista, a_borrar) do
  Enum.reject(lista, fn elemento -> elemento in a_borrar end)
end
```

Lo que venga en la lista de borrados y no esté en la original simplemente no
afecta el resultado, como el `'cafe'` del ejemplo.
