FROM itzg/minecraft-server:java17

# Accept EULA automatically
ENV EULA=TRUE

# Server configuration
ENV TYPE=FABRIC \
    VERSION=1.21.1 \
    MEMORY=2G \
    INIT_MEMORY=1G \
    MAX_MEMORY=4G \
    DIFFICULTY=normal \
    MAX_PLAYERS=10 \
    MOTD="Bryden loves little boys" \
    PVP=false \
    ENABLE_RCON=false \
    ENABLE_QUERY=false

# Install Cobblemon and Fabric API from Modrinth
ENV MODRINTH_PROJECTS=cobblemon,fabric-api

# Railway health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s \
  CMD mc-health || exit 1

EXPOSE 25565
