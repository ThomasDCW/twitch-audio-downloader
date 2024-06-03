# Twitch Audio Downloader

Ce projet permet de télécharger l'audio des vidéos Twitch en utilisant un serveur web simple basé sur CherryPy.

## Installation

1. Clonez le dépôt :

   ```sh
   git clone git@github.com:ThomasDCW/twitch-audio-downloader.git
   ```

2. Construisez l'image Docker et démarrer le conteneur :

   ```sh
   docker-compose up --build
   ```

## Utilisation

1. Accédez à l'application web via `http://localhost:8080`.
2. Entrez l'URL de la vidéo Twitch dans le champ de texte et soumettez le formulaire.
3. L'audio sera téléchargé et sauvegardé dans le répertoire `output`.

## Structure du Projet

- `app.py` : Script principal pour démarrer le serveur CherryPy.
- `download_audio.sh` : Script Bash pour télécharger l'audio à partir d'une URL Twitch.
- `Dockerfile` : Instructions pour construire l'image Docker.
- `docker-compose.yml` : Configuration Docker Compose.
- `requirements.txt` : Dépendances Python.
- `static/` : Fichiers statiques (CSS).
