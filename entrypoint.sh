#!/bin/sh

cd /data

if [ ! -f "./cache/paper_$MINECRAFT_VERSION.jar" ]; then
    if [ ! -d "./cache" ]; then
        mkdir ./cache
    fi
    BUILD=$(wget -q -O - https://api.papermc.io/v2/projects/paper/versions/$MINECRAFT_VERSION/builds | jq -r '.builds[-1].build')
    wget -nv https://api.papermc.io/v2/projects/paper/versions/$MINECRAFT_VERSION/builds/$BUILD/downloads/paper-$MINECRAFT_VERSION-$BUILD.jar -O ./cache/paper_$MINECRAFT_VERSION.jar
fi

chmod o-rwx ./cache
chown -R minecraft:minecraft /data

sudo -u minecraft /opt/java/openjdk/bin/java -Xms$MEMORYSIZE -Xmx$MEMORYSIZE $JAVAFLAGS -Dcom.mojang.eula.agree=$MINECRAFT_EULA -jar ./cache/paper_$MINECRAFT_VERSION.jar $PAPERMC_FLAGS 
