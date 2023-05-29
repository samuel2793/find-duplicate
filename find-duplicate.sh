#!/bin/bash

recursive=0
interactive=0

while (( "$#" )); do
  case "$1" in
    -h|--help)
      man find-duplicate
      exit
      ;;
    -r|--recursive)
      recursive=1
      shift
      ;;
    -i|--interactive)
      interactive=1
      shift
      ;;
    --)
      shift
      break
      ;;
    -*|--*=)
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *)
      shift
      ;;
  esac
done

find_func() {
  if [ "$recursive" -eq 1 ]
  then
    find . -type f -print0 | xargs -0 md5sum | sort | uniq -D -w32
  else
    find . -maxdepth 1 -type f -print0 | xargs -0 md5sum | sort | uniq -D -w32
  fi | awk '{if ($1!=l && NR>1) print ""; print; l=$1}'
}

duplicates=$(find_func)

if [ "$interactive" -eq 1 ]
then
  IFS=$'\n'
  oldhash=""
  declare -a options
  for line in $duplicates; do
    hash=$(echo "$line" | cut -d' ' -f1)
    if [ "$hash" != "$oldhash" ] && [ ! -z "$oldhash" ]; then
      echo "Archivos duplicados encontrados:"
      i=1
      for option in "${options[@]}"; do
        file_info=$(ls -lh --time-style=long-iso "$option")
        echo "$i) Hash: $oldhash Tamaño: $(echo "$file_info" | awk '{print $5}') Fecha: $(echo "$file_info" | awk '{print $6, $7}') Nombre: $option"
        ((i++))
      done
      echo "$i) No borrar ninguno"
      echo "¿Cuál de estos archivos deseas conservar? (ingresa el número)"
      read choice
      if [ "$choice" -ne "$i" ]; then
        for ((i=1; i<=${#options[@]}; i++)); do
          if [ "$i" -ne "$choice" ]; then
            rm "${options[$i-1]}"
            echo "Se eliminó el archivo: ${options[$i-1]}"
          fi
        done
      fi
      options=()
    fi
    options+=($(echo "$line" | cut -d' ' -f3-))
    oldhash=$hash
  done
else
  echo "$duplicates"
fi
