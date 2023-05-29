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

## Instalación

Para añadir `find-duplicate` a tu sistema, puedes copiar y pegar los siguientes comandos en tu terminal:

```bash
git clone https://github.com/samuel2793/find-duplicate.git
cd find-duplicate
chmod +x find-duplicate.sh
mv find-duplicate.sh find-duplicate
sudo cp find-duplicate /usr/local/bin/
sudo cp find-duplicate.1 /usr/local/share/man/man1
sudo mandb
cd ..
rm find-duplicate -r -f
```
Por favor, ten en cuenta que esto asume que `/usr/local/bin` está en el PATH del usuario, y que los manuales se almacenan en `/usr/local/share/man/man1`.
