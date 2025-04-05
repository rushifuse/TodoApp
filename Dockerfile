# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy Maven wrapper and related files first (cache layer optimization)
COPY mvnw ./
COPY .mvn/ .mvn
COPY pom.xml .

# Download dependencies (offline mode)
RUN chmod +x mvnw && ./mvnw dependency:go-offline

# Copy source code
COPY src ./src

# Build the application (skip tests for faster build)
RUN ./mvnw clean package -DskipTests

# Expose port (you can change this if using a different port)
EXPOSE 8080

# Run the app (matches JAR name created by <finalName>app</finalName>)
CMD ["java", "-jar", "target/app.jar"]
