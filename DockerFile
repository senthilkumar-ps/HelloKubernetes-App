FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /springprofile
RUN pwd
RUN ls -l
COPY  /target/springprofile.jar  ./
RUN pwd
RUN ls -l
ENTRYPOINT ["java","-jar","/springprofile/springprofile.jar"]