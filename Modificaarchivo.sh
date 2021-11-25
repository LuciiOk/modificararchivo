#!/bin/bash
if [[ $# -ne 4 ]];then # se validan los parametros que se ingresaron al iniciar el sh
  echo El script no recibió los 4 parametros requeridos
  exit 1
fi

archivo=$1
dueno=$2
opcion=$3

echo $archivo

#Verifica que el archivo que el archivo y el usuario del archivo exista.
if (find / -user $dueno -iname $archivo -print -quit) then
    direccion=$(find / -user $dueno -iname $archivo -print -quit) #se almacena la ruta donde esta el
    echo $direccion                                                 #archvio
    if [ "$opcion" = "-p" ]; then # valida si el parametro es para los permisos
        chmod $4 "$direccion"
        echo los permisos del archivo \"direccion\" han sido cambiados a $4
        exit 0 #al finalizar se termina el programa sin errores
    fi
    if [ "$opcion" = "-d" ]; then # valida si el parametro es para los duenos
        chown $4 "$direccion"
        echo "Ahora el dueno del archivo \"$direccion\" es $4"
        exit 0 #al finalizar se termina el programa sin errores
    fi
    if [ "$opcion" = "-g" ]; then # valida si el parametro es para los grupos
        chgrp $4 "$direccion"
        echo "Ahora el grupo del archivo \"$direccion\" es $4"
        exit 0 #al finalizar se termina el programa sin errores
    fi
    echo Has ingresado una opcion incorrecta 
    exit 1 #no se ingreso una opcion incorrecta con error
else
    echo El archivo ingresado no existe
    exit 1 #se finaliza el programa
fi





