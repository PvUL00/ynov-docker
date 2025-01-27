# Utiliser l'image officielle de Redis
FROM redis:alpine

# Créer un utilisateur non-root
RUN addgroup -g 1001 redisgroup && adduser -u 1001 -G redisgroup -D redisuser

# Passer à l'utilisateur non-root
USER redisuser

# Ajouter un HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD redis-cli ping | grep -q PONG || exit 1

# Commande par défaut pour Redis
CMD ["redis-server"]

