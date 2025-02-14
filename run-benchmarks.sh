#!/bin/bash

# Crear un directorio para almacenar los outputs
mkdir -p outputs

# Declarar un array para los lenguajes
languages=("python" "java" "javascript" "kotlin" "rust")

# Array asociativo para almacenar los tiempos de ejecución
declare -A execution_times

for lang in "${languages[@]}"; do
    echo "Procesando $lang..."
    cd $lang
    
    # Construir la imagen de Docker
    echo "Construyendo imagen para $lang..."
    docker build -t "script_$lang" .
    
    # Ejecutar el contenedor
    echo "Ejecutando contenedor para $lang..."
    execution_time=$(docker run --rm -v "$(pwd)/$lang:/app/$lang" "script_$lang")

    # Guardar el tiempo en el array asociativo
    execution_times[$lang]=$execution_time
    
    cd ..
done

# Recopilar y mostrar resultados
echo -e "\nResultados:"
echo "Lenguaje | Tiempo (ms)"
echo "---------|------------"
# Ordenar el array de lenguajes basado en los tiempos de ejecución
IFS=$'\n' sorted=($(sort -nr <<<"${execution_times[*]}"))
unset IFS

# Mostrar resultados ordenados
for time in "${sorted[@]}"; do
    for lang in "${languages[@]}"; do
        if [[ "${execution_times[$lang]}" == "$time" ]]; then
            echo "$lang | $time"
            break
        fi
    done
done