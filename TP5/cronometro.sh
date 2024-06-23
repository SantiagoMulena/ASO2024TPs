#!/bin/bash

# Variables
elapsed=0
running=false

while true; do
    clear  

    # Menu
    echo "Cronometro:"
    echo "****************"
    echo "Tiempo transcurrido: $elapsed segundos"
    echo "****************"
    echo "Opciones:"
    echo "  1 - Mantener apretado para iniciar/Soltar para parar "
    echo "  2 - Reiniciar el cronometro"
    echo "  q - Salir"

    read -rsn1 input

    if [ "$input" = "1" ]; then
        if [ "$running" = false ]; then
            # Iniciar 
            running=true
            start_time=$(date +%s)
        else
            # Parar 
            running=false
            elapsed=$((elapsed + $(date +%s) - start_time))
        fi
    elif [ "$input" = "2" ]; then
        # Reiniciar
        elapsed=0
        running=false
    elif [ "$input" = "q" ]; then
        # Salir
        break
    else
        echo "Opcion incorrecta"
    fi
done

