# SpringBootProfiles-App

Prerequisite:

1. Docker Installation
2. Kubernetes Cluster

About Application:
------------------
In development an app, there are definitely several environment such as dev, test, demo, staging, production, etc.
Each environment has different configurations for database, server port, etc.
So in this case we need configuration profiling.

Prepare application.properties:
-------------------------------
Here is sample with 2 profile, dev and prod under src/main/resorces

Config pom.xml
--------------
Next we will add profile configuration in pom.xml

<profiles>
        <profile>
            <id>dev</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <properties>
                <activatedProperties>dev</activatedProperties>
            </properties>
        </profile>
        <profile>
            <id>prod</id>
            <properties>
                <activatedProperties>prod</activatedProperties>
            </properties>
        </profile>
    </profiles>\
    
Maven compile & run example:
----------------------------
mvn clean package -P dev

mvn clean package -P prod

We need to implement the maven profiling on spring boot:
---------------------------------------------------------
mvn spring-boot:run -P dev

mvn spring-boot:run -P prod

Deploy App in Docker And Kubernetes:
------------------------------------
1. Create Docker iamge
    
        sudo docker build -t springprofile-dev .
        sudo docker build -t springprofile-prod .
      
        ** While generating docker file need to change some configuration and those steps given in DockerFile
      
2. Run Docker Image Locally:      

        ** Docker Command:
        
        docker run -d -p 8081:8081 -e "SPRING_PROFILES_ACTIVE=dev" --name spr-dev springprofile-dev :latest
        docker run -d -p 8082:8082 -e "SPRING_PROFILES_ACTIVE=prod" --name spr-prod springprofile-prod :latest
        
3. Push Image to DockerHUb

        ** Docker Command:
        
        sudo docker tag springprofile psmsenthilkumar/springprofile-dev
        sudo docker push psmsenthilkumar/springprofile-dev
        
        sudo docker tag springprofile psmsenthilkumar/springprofile-prod
        sudo docker push psmsenthilkumar/springprofile-prod
        
4. Deploy App in Kubernetes Cluster

        kubectl create -f SpringProfile_k8s_dev.yaml
        kubectl create -f SpringProfile_k8s_prod.yaml
        
5. Execute below command to get APP URL

        kubectl get svc
        
6. App URL:

        http://ab7ea8d77e3224b49a7eaeb20bfe81c7-2087719272.ap-south-1.elb.amazonaws.com:8081/
        http://a50f3a9a9e6b04de1967ce858d1b6add-1766946230.ap-south-1.elb.amazonaws.com:8082/
        
** Note - Kubernates Deployment done in AWS EC2         

        
