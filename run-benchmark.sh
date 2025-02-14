#!/bin/bash

# Crear un directorio para almacenar los outputs
mkdir -p outputs

# Declarar un array para los lenguajes
languages=("kotlin")

for lang in "${languages[@]}"; do
    echo "Procesando $lang..."
    cd $lang
    
    # Construir la imagen de Docker
    echo "Construyendo imagen para $lang..."
    docker build -t "script_$lang" .
    
    # Ejecutar el contenedor
    echo "Ejecutando contenedor para $lang..."
    execution_time=$(docker run --rm -v "$(pwd)/$lang:/app/$lang" "script_$lang")
    
    cd ..
done

# Opcional: Recopilar y mostrar resultados
echo -e "\nResultados:"
echo "Lenguaje | Tiempo (ms)"
echo "---------|------------"
for lang in "${languages[@]}"; do
    time=$(cat "$lang/${lang}_output.txt")
    echo "$lang | $execution_time"
done