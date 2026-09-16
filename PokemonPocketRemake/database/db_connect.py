import sqlite3
import random
from core.pokemon_card import PokemonCard
from config.config import DATABASE_PATH

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