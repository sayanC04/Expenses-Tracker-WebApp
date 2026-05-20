FROM maven:3.9.9-eclipse-temurin-21 AS cacher

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true


#stage 2 execute the jar file from the above image

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=cacher /app/target/*.jar /app/expense.jar


CMD ["java", "-jar", "expense.jar"] 


