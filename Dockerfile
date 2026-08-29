```dockerfile
FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Find and download the latest Paper build for Minecraft 1.21.11
RUN BUILD=$(curl -fsSL https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds \
    | grep -o '"build":[0-9]*' \
    | tail -1 \
    | grep -o '[0-9]*') \
    && curl -fL \
    "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/${BUILD}/downloads/paper-1.21.11-${BUILD}.jar" \
    -o server.jar

EXPOSE 25565

CMD ["java", "-Xms512M", "-Xmx2G", "-jar", "server.jar", "--nogui"]
```
