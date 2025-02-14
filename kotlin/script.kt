import java.io.File
import kotlin.system.measureTimeMillis

fun countingSort(array: IntArray) {
    val size = array.size
    val output = IntArray(size)

    val max = array.maxOrNull() ?: 0
    val count = IntArray(max + 1)

    for (i in array.indices) {
        count[array[i]]++
    }

    for (i in 1..max) {
        count[i] += count[i - 1]
    }

    var i = size - 1
    while (i >= 0) {
        output[count[array[i]] - 1] = array[i]
        count[array[i]]--
        i--
    }

    for (i in array.indices) {
        array[i] = output[i]
    }
}

fun main() {
    val data = intArrayOf(8, 9, 3, 1, 4, 6, 11, 15, 19, 16, 14, 3, 25, 23)

    // Crear el directorio si no existe
    val dir = File("Kotlin")
    dir.mkdirs()

    // Medir el tiempo de ejecución
    val executionTime = measureTimeMillis {
        countingSort(data)
    }

    val fileName = "kotlin_output.txt"
    File(fileName).printWriter().use { out ->
        data.forEach { out.println(it) }
    }

    println(executionTime)
}
