FROM rust:alpine3.17

# Instalar dependencias necesarias
RUN apk add --no-cache build-base

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo fuente
COPY script.rs .

# Compilar el programa
RUN rustc script.rs

# Ejecutar el programa
CMD ["./script"]