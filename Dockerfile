FROM eclipse-temurin:21-jre

WORKDIR /server

COPY . /server

EXPOSE 25565

CMD ["java", "-Xms512M", "-Xmx2G", "-jar", "server.jar", "--nogui"]
