# Find Duplicate Files

Este script de bash permite encontrar archivos duplicados en una carpeta y sus subcarpetas.

## Uso

`./find-duplicate.sh [OPCIONES]`

## Opciones

- `-h, --help`: Muestra la ayuda.
- `-r, --recursive`: Busca de manera recursiva en las subcarpetas.
- `-i, --interactive`: Pregunta al usuario qué archivo desea mantener cuando se encuentran duplicados.

## Ejemplos

Buscar archivos duplicados en el directorio actual y sus subdirectorios:

`./find-duplicate.sh -r`

Buscar archivos duplicados en el directorio actual y sus subdirectorios, y preguntar al usuario qué archivo desea mantener:

`./find-duplicate.sh -r -i`
