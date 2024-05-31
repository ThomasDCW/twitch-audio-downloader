#!/bin/bash

# Vérifier si l'URL est fournie
if [ -z "$1" ]; then
    echo "Usage: $0 <URL_DE_LA_VIDEO_TWITCH>"
    exit 1
fi

# URL de la vidéo Twitch
TWITCH_URL="$1"

# Obtenir l'URL du flux avec Streamlink
STREAM_URL=$(streamlink "$TWITCH_URL" audio --stream-url)

# Vérifier si STREAM_URL a été obtenue avec succès
if [ -z "$STREAM_URL" ]; then
    echo "Impossible d'obtenir le flux pour l'URL fournie."
    exit 1
fi

# Générer un nom de fichier unique basé sur la date et l'heure actuelles
FILENAME=$(date +"%Y%m%d_%H%M%S").mp3

# Télécharger l'audio avec FFMpeg
ffmpeg -i "$STREAM_URL" -q:a 0 -map a "/output/$FILENAME"

echo "Téléchargement et extraction de l'audio terminés. Fichier sauvegardé sous le nom : $FILENAME"
