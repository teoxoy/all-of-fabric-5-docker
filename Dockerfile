FROM debian:latest

EXPOSE 25565
VOLUME /var/FTB/world

RUN apt update && apt upgrade -y
RUN apt install -y wget unzip openjdk-17-jre-headless

WORKDIR /var/FTB

ADD ./server.properties ./server.properties

RUN wget https://media.forgecdn.net/files/3936/583/All-of-Fabric-5-Server-1.4.1.zip
RUN unzip ./All-of-Fabric-5-Server-1.4.1.zip

RUN echo "eula=true" > ./eula.txt

RUN chmod +x ./startserver.sh && chown -R 777 ./startserver.sh
CMD ./startserver.sh
