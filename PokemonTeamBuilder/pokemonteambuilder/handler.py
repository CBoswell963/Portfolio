# handler.py
import json
from http.server import BaseHTTPRequestHandler, HTTPServer, SimpleHTTPRequestHandler
import sqlite3
from urllib.parse import urlparse

class PokemonHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        parsed_path = urlparse(self.path)
        if parsed_path.path == "/api/pokemon-list":
            self.handle_pokemon_list()
        else:
            self.send_error(404, "Not Found")

    def handle_pokemon_list(self):
        conn = sqlite3.connect('database/pokemon.db')
        cursor = conn.cursor()

