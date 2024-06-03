import cherrypy
import subprocess
import os

# Définir la classe
class TwitchAudioDownloader:
    @cherrypy.expose
    def index(self):
        return '''
               <html>
               <head>
                   <link rel="stylesheet" type="text/css" href="/static/styles.css">
               </head>
               <body>
                   <form method="get" action="submit">
                       <input type="text" name="twitch_url" placeholder="Entrez l'URL Twitch" />
                       <button type="submit">Soumettre</button>
                   </form>
               </body>
               </html>
        '''

    @cherrypy.expose
    def submit(self, twitch_url=None):
        # Vérifier si une URL Twitch a été fournie
        if twitch_url:
            print(f"URL reçue : {twitch_url}")
            # Exécuter le script Bash pour télécharger l'audio
            result = subprocess.run(["/app/download_audio.sh", twitch_url], capture_output=True, text=True)
            print(f" ==========> {result.stdout}") 
            # Retourner le résultat de l'exécution du script
            return f'''
               <html>
               <head>
                   <link rel="stylesheet" type="text/css" href="/static/styles.css">
               </head>
               <body>
                   <p>{result.stdout}</p>
               </body>
               </html>
        '''
        # Retourner un message si aucune URL n'a été fournie
        return '''
               <html>
               <head>
                   <link rel="stylesheet" type="text/css" href="/static/styles.css">
               </head>
               <body>
                   <p>Aucune URL fournie</p>
               </body>
               </html>
        '''

# Configuration et démarrage du serveur CherryPy
if __name__ == '__main__':
    cherrypy.config.update({
        'server.socket_host': '0.0.0.0',
        'tools.staticdir.on': True,
        'tools.staticdir.dir': os.path.abspath(os.getcwd()),
        'tools.staticdir.index': 'index.html',
    })
    cherrypy.quickstart(TwitchAudioDownloader(), '/', {
        '/static': {
            'tools.staticdir.on': True,
            'tools.staticdir.dir': os.path.join(os.path.abspath(os.getcwd()), 'static')
        }
    })
