FROM eclipse-temurin:17-jre-focal
LABEL maintainer="me@nicdev.it"
ENV MINECRAFT_EULA=true
ENV MINECRAFT_VERSION=1.19.3
RUN apt-get update && apt-get install -y wget jq sudo nano && rm -rf /var/lib/apt/lists/*
WORKDIR /data
VOLUME /data
EXPOSE 25565

# Create User
RUN addgroup -gid 1000 minecraft && \
    adduser -gid 1000 -system minecraft

# Execute Script
ADD entrypoint.sh /opt/app/entrypoint.sh
RUN chmod +x /opt/app/entrypoint.sh
ENTRYPOINT ["/opt/app/entrypoint.sh"]

# Set memory size
ARG memory_size=1G
ENV MEMORYSIZE=$memory_size

# Set Java Flags
ARG java_flags="-Dlog4j2.formatMsgNoLookups=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=mcflags.emc.gs -Dcom.mojang.eula.agree=true"
ENV JAVAFLAGS=$java_flags

# Set PaperMC Flags
ARG papermc_flags="--nojline"
ENV PAPERMC_FLAGS=$papermc_flags
