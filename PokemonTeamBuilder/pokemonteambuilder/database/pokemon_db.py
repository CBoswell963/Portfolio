import sqlite3
import os
DB_PATH = "pokemon.db"

def create_database():
    pass

def get_pokemon(pokemon_name):
    pass

def populate_database():
    pass

def initialize():
    if not os.path.exists(DB_PATH):
        print("Creating the Pokemon Database...")
        create_database()
        populate_database()
    else:
        print("Pokemon Database already exists.")