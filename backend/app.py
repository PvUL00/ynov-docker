import time
import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    count = get_hit_count()
    return 'Helloooooo World! I have been seen {} times.\n'.format(count)

@app.route('/health', methods=['GET'])
def health():
    try:
        # Vérifie la connexion à Redis
        cache.ping()
        # Si Redis est accessible, retourne un statut "healthy"
        return jsonify({"status": "healthy"}), 200
    except redis.exceptions.ConnectionError:
        # Si Redis est inaccessible, retourne un statut "unhealthy"
        return jsonify({"status": "unhealthy"}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
