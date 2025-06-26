import sqlite3
import os
DB_PATH = "pokemon.db"

def create_database():
    conn = connect_db()

    conn.execute('''
        CREATE TABLE IF NOT EXISTS pokemon (
        dex_id INTEGER PRIMARY KEY AUTOINCREMENT,
        pokemon_name TEXT,
        type1 TEXT NOT NULL,
        type2 TEXT,
        image_url TEXT
        ''')

    conn.commit()
    conn.close()

def connect_db():
    return sqlite3.connect(DB_PATH)

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