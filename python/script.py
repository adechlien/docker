import time

def countingSort(array):
    size = len(array)
    output = [0] * size

    count = [0] * (max(array) + 1)

    for i in range(0, size):
        count[array[i]] += 1

    for i in range(1, max(array) + 1):
        count[i] += count[i - 1]

    i = size - 1
    while i >= 0:
        output[count[array[i]] - 1] = array[i]
        count[array[i]] -= 1
        i -= 1

    for i in range(0, size):
        array[i] = output[i]

data = [8, 9, 3, 1, 4, 6, 11, 15, 19, 16, 14, 3, 25, 23]

# Inicio del tiempo
start_time = time.time()

# Ejecutar el algoritmo
countingSort(data)

# Fin del tiempo
end_time = time.time()

# Calcular tiempo en milisegundos
execution_time = (end_time - start_time) * 1000

x = 'python/python_output.txt'
with open(x, 'w') as file:
    for i in data:
        file.write(str(i)+ '\n')

print(execution_time)
