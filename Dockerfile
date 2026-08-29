FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN curl -L "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/128/downloads/paper-1.21.11-128.jar" -o server.jar

EXPOSE 25565

CMD ["java", "-Xms512M", "-Xmx2G", "-jar", "server.jar", "--nogui"]
