# Use the official maven/Java 8 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM maven:3.5-jdk-8-alpine as builder

# Add Maintainer Info
MAINTAINER SenthilKumar <psm.senthilkumar@gmail.com>

# Add a volume pointing to /tmp
VOLUME /tmp

# Copy local code to the container image
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

# Run the web service on container startup
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-Djava.security.egd=file:/prod/./urandom","-Dspring.profiles.active=dev","-Dspring.profiles.active=prod","-jar","-jar","springprofile.jar"]