# Use the official maven/Java 8 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM maven:3.5-jdk-8-alpine as builder

# Add Maintainer Info
MAINTAINER Senthil Kumar <psm.senthilkumar@gmail.com>

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8081/8082 available to the world outside this container
# For Profile Dev Image
#EXPOSE 8081

# For Profile Prod Image
EXPOSE 8082

# Copy local code to the container image.
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn package -DskipTests

# Use AdoptOpenJDK for base image
# It's important to use OpenJDK 8u191 or above that has container support enabled.
# https://hub.docker.com/r/adoptopenjdk/openjdk8
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM adoptopenjdk/openjdk8:jdk8u202-b08-alpine-slim

# Copy the jar to the production image from the builder stage.
COPY --from=builder /app/target/Springbootprofiles-*.jar /springprofile.jar

# Run the web service on container startup.
# Docker Dev Image
#ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=dev","-jar","springprofile.jar"]

# Docker Prod Image
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=prod","-jar","springprofile.jar"]
