# Utiliser une image de base avec Python et FFMpeg
FROM python:3.9-slim

# Installer FFMpeg et Streamlink
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && pip install streamlink \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Créer un répertoire pour le script et l'audio
RUN mkdir -p /app /output

# Copier le script dans le conteneur
COPY download_audio.sh /app/download_audio.sh

# Donner les permissions d'exécution au script
RUN chmod +x /app/download_audio.sh

# Définir le répertoire de travail
WORKDIR /app

# Définir l'entrée du conteneur
ENTRYPOINT ["/app/download_audio.sh"]
