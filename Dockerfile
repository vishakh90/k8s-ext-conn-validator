ARG DOCKER_REGISTRY='docker.io/'
FROM ${DOCKER_REGISTRY}eclipse-temurin:17-jre
ADD target/k8s-ext-conn-validator-0.0.1-SNAPSHOT.jar k8s-ext-conn-validator.jar
MAINTAINER Vishakh Oommen Koshy
ENTRYPOINT ["java","-Dspring.datasource.password=${DB_PASS}","-Dspring.datasource.username=${DB_USER}","-Dspring.datasource.url=${DB_URL}","-jar","k8s-ext-conn-validator.jar"]