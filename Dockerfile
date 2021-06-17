#### image inside build #######
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/Springbootprofiles-0.0.1-SNAPSHOT.jar /usr/local/lib/springprofile.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/springprofile.jar"]



#### image outside build #######
# For Java 8, try this
#FROM openjdk:8-jdk-alpine

# For Java 11, try this
# FROM adoptopenjdk/openjdk11:alpine-jre

# Refer to Maven build -> finalName
#ARG JAR_FILE=target/Springbootprofiles-0.0.1-SNAPSHOT.jar

# cd /opt/app
#WORKDIR /opt/app

# cp target/Springbootprofiles-0.0.1-SNAPSHOT.jar /opt/app/app.jar
#COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
#ENTRYPOINT ["java","-jar","app.jar"]