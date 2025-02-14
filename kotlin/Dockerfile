FROM openjdk:17-slim

# Instalar wget y unzip para descargar Kotlin
RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q https://github.com/JetBrains/kotlin/releases/download/v1.8.0/kotlin-compiler-1.8.0.zip && \
    unzip kotlin-compiler-1.8.0.zip -d /opt && \
    rm kotlin-compiler-1.8.0.zip

# Agregar Kotlin al PATH
ENV PATH $PATH:/opt/kotlinc/bin

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo fuente
COPY . .

# Compilar y ejecutar el programa Kotlin
CMD ["sh", "-c", "kotlinc script.kt -include-runtime -d app.jar && java -jar app.jar"]