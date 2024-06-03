FROM python:3.10-slim

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y ffmpeg streamlink && \
    apt-get clean

# Copier les fichiers du projet
WORKDIR /app
COPY app.py /app/app.py
COPY download_audio.sh /app/download_audio.sh
COPY static /app/static

# Rendre le script Bash exécutable
RUN chmod +x download_audio.sh

# Installer les dépendances Python
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Exposer le port
EXPOSE 8080

# Démarrer le serveur CherryPy
CMD ["python", "app.py"]
