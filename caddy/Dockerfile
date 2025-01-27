# Utiliser l'image officielle de Caddy
FROM caddy:latest

# Installer curl
RUN apk add --no-cache curl

# Créer un utilisateur non-root
RUN addgroup -g 1001 caddygroup && adduser -u 1001 -G caddygroup -D caddyuser

# Ajouter un HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:80 || exit 1

# Passer à l'utilisateur non-root
USER caddyuser
