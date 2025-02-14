FROM python:3.11-slim
WORKDIR /app
COPY script.py .
RUN touch python_output.txt # Crea el archivo si no existe
CMD ["python", "script.py"]