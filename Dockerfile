from gradle:7.5-jdk17 as build
WORKDIR /app
COPY . .
run gradle build --no-deamon
FROM azul/zulu-openjdk-alpine:17

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/agendador-tarefas.jar

EXPOSE 8081

CMD ["java", "-jar", "/app/agendador-tarefas.jar"]