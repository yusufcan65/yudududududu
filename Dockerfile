FROM openjdk:17
ADD target/yenivesondeneme-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]