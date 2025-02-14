FROM openjdk:17-slim
WORKDIR /app
COPY script.java .
RUN javac script.java
CMD ["java", "script"]