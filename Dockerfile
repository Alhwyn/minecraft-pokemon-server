FROM itzg/minecraft-server:java17

# Accept EULA automatically
ENV EULA=TRUE

# Server configuration
ENV TYPE=FABRIC \
    VERSION=1.20.1 \
    MEMORY=4G \
    INIT_MEMORY=1G \
    MAX_MEMORY=4G \
    DIFFICULTY=normal \
    MAX_PLAYERS=10 \
    MOTD="Cobblemon Server on Railway" \
    PVP=false \
    ENABLE_RCON=false

# Auto-install Cobblemon from Modrinth
ENV MODRINTH_PROJECTS=cobblemon

# Also install Fabric API (required dependency)
ENV MODRINTH_PROJECTS=cobblemon,fabric-api

# Railway health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s \
  CMD mc-health || exit 1

EXPOSE 25565

VOLUME /data