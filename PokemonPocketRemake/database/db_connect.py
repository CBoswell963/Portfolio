"""
    File used to connect to the SQL database and table
    utilized in the app
"""

import sqlite3
import random
from core.pokemon_card import PokemonCard
from config.config import DATABASE_PATH

"""
    Method for selecting a card from the card table based on the passed rarity
"""
def get_random_card_by_rarity(rarity):
    conn = sqlite3.connect(DATABASE_PATH)
    cursor = conn.cursor()
    cursor.execute('''SELECT card_name, card_type, card_image, card_rarity, pokemon_type, card_id FROM cards
                   WHERE card_rarity = ?''', (rarity,))
    rows = cursor.fetchall()
    conn.close()

    if not rows:
        return None

    selected = random.choice(rows)
    return PokemonCard(*selected)

"""
    Method for adding a user to the user table
"""
def create_user(username, password):
    conn = sqlite3.connect(DATABASE_PATH)
    cursor = conn.cursor()

"""
    Method for confirming the passed username and password
    match to a user already registered in the user table
"""
def login_user(username, password):
    conn = sqlite3.connect(DATABASE_PATH)