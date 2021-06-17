FROM openjdk:8-jdk-alpine
COPY target/springprofile.jar spring-profile.jar
ENTRYPOINT ["java","-jar","/spring-profile.jar"]