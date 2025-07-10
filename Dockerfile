FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY target/SB_Demo_Prg.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
