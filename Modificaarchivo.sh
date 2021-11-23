#!/bin/bash
if [ $# -ne 4 ]; then
  echo El script no recibió los 4 parametros requeridos
  exit 1
fi

archivo=$1
dueno=$2
opcion=$3

echo $archivo

if (find / -user $dueno -iname $archivo -print -quit) then
    direccion=$(find / -user $dueno -iname $archivo -print -quit) #se almacena la ruta donde esta el
    echo $direccion                                                 #archvio
    if [ "$opcion" = "-p" ]; then # valida si el parametro es para los permisos
        chmod $4 "$direccion"
        echo permiso
        exit
    fi
    if [ "$opcion" = "-d" ]; then # valida si el parametro es para los duenos
        chown $4 "$direccion"
        echo "Ahora el dueno del archivo \"$direccion\" es $4"
        exit
    fi
    if [ "$opcion" = "-g" ]; then # valida si el parametro es para los grupos
        chgrp $4 "$direccion"
        echo "Ahora el grupo del archivo \"$direccion\" es $4"
        exit
    fi
    echo Has ingresado una opcion incorrecta
else
    echo el archivo ingresado no existe
fi





