#!/bin/bash
echo "Ingresa un nombre:"
read nombre
response=$(curl -s "https://api.agify.io/?name=$nombre")

if [ $? -ne 0 ]; then
    echo "Error,no se encontro una edad para el nombre $nombre"
    exit 1
fi

edad_probable=$(echo "$response" | jq -r '.age')
if [ -z "$edad_probable" ]; then
    echo "No se encontró información de edad probable para $nombre."
else
    echo "La edad probable de $nombre es: $edad_probable años."
fi
