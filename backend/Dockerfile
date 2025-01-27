# Use a lightweight Python base image
FROM python:3.10-slim

# Set environment variables to prevent Python from buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Installer curl pour le healthcheck
RUN apt-get update && apt-get install -y --no-install-recommends curl && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Créer un utilisateur non-root
RUN groupadd -g 1001 flaskgroup && useradd -r -u 1001 -g flaskgroup flaskuser

# Passer à l'utilisateur non-root
USER flaskuser

# Copy application code
COPY app.py .

# Run the Flask App
CMD ["python", "app.py"]

# Expose the port that the Flask app will run on
EXPOSE 5000

# Ajouter un HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://flask_app:5000 || exit 1

