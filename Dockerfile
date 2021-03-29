# Use the official maven/Java 8 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM maven:3.5-jdk-8-alpine as builder

# Add Maintainer Info
MAINTAINER SenthilKumar <psm.senthilkumar@gmail.com>

# Add a volume pointing to /tmp
VOLUME /tmp

RUN mkdir -p /app /app/appconfig 

# Copy local code to the container image
COPY pom.xml /app
COPY src /app/src 
COPY src/main/resources/ /app/appconfig/

WORKDIR /app

RUN pwd
RUN ls -l

# Build a release artifact.
RUN mvn package -DskipTests

# Use AdoptOpenJDK for base image
# It's important to use OpenJDK 8u191 or above that has container support enabled.
# https://hub.docker.com/r/adoptopenjdk/openjdk8
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM adoptopenjdk/openjdk8:jdk8u202-b08-alpine-slim
ENV MAIN_OPTS '' 
# Copy the jar to the production image from the builder stage.
ENTRYPOINT ["java", "-jar","/hellok8s.jar"]


# ENTRYPOINT java $JAVA_OPTS -jar ./springprofile.jar $MAIN_OPTS
# ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=dev","-jar","/springprofile.jar"]