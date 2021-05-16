FROM openjdk:16-slim

LABEL maintainer="msfukui@gmail.com"
LABEL org.opencontainers.image.authors="msfukui@gmail.com"
LABEL org.opencontainers.image.documentation="msfukui's personal minecraft environment."
LABEL org.opencontainers.image.version="0.0.1"

WORKDIR /app/lib

RUN apt update -y && apt upgrade -y && apt install -y \
  curl \
  git

# Add SpiGot
# c.f. https://www.spigotmc.org/wiki/buildtools/
RUN curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
  && java -jar BuildTools.jar --rev latest \
  && mv spigot-*.jar spigot.jar \
  && java -Xmx2G -jar spigot.jar \
  && mv eula.txt eula.txt.org \
  && sed "s/eula=false/eula=true/" eula.txt.org > eula.txt

# Add Plugins, Geyser and Floodgate
# c.f.
# https://github.com/GeyserMC/Geyser/wiki/Setup
# https://github.com/GeyserMC/Geyser/wiki/Floodgate
RUN mkdir -p plugins \
  && cd plugins \
  && curl -O https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar \
  && curl -O https://ci.opencollab.dev//job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/bukkit/target/floodgate-bukkit.jar
