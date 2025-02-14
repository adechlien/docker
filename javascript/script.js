const fs = require('fs');

function countingSort(array) {
    let size = array.length;
    let output = new Array(size).fill(0);
    let max = Math.max(...array);
    let count = new Array(max + 1).fill(0);

    for (let i = 0; i < size; i++) {
        count[array[i]]++;
    }

    for (let i = 1; i <= max; i++) {
        count[i] += count[i - 1];
    }

    for (let i = size - 1; i >= 0; i--) {
        output[count[array[i]] - 1] = array[i];
        count[array[i]]--;
    }

    for (let i = 0; i < size; i++) {
        array[i] = output[i];
    }
}

let data = [8, 9, 3, 1, 4, 6, 11, 15, 19, 16, 14, 3, 25, 23];

// Inicio del tiempo
const startTime = performance.now();

// Ejecutar el algoritmo
countingSort(data);

// Fin del tiempo
const endTime = performance.now();

// Calcular tiempo de ejecución en milisegundos
const executionTime = endTime - startTime;

let filePath = 'javascript/javascript_output.txt';
fs.writeFileSync(filePath, data.join('\n'), 'utf8');

console.log(executionTime.toFixed(3));
