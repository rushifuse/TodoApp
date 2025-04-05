# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper files first (for caching)
COPY mvnw .
COPY .mvn .mvn

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN chmod +x mvnw && ./mvnw dependency:go-offline

# Copy the rest of the source code
COPY src src

# Build the app (output will be target/app.jar)
RUN ./mvnw clean package -DskipTests

# Expose the port (matches application.properties)
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "target/app.jar"]
