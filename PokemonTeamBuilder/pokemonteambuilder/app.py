
from database.pokemon_db import initialize


def run():
    server_address = ("", 5000)
    httpd = HTTPServer(server_address, PokemonHandler)