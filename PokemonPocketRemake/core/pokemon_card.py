import pygame

from config.config import CARD_IMAGE_PATH

class PokemonCard:

    """
        Method for creating the PokemonCard object.
    """
    def __init__(self, card_name, card_type, card_image, rarity, pokemon_type,
                 set_index):
        CARD_WIDTH = 357
        CARD_HEIGHT = 512
        self.card_name = card_name
        self.card_type = card_type
        # Retrieve designated card image and check to see if loaded properly
        card_path = CARD_IMAGE_PATH / card_image
        try:
            self.card_image = pygame.transform.scale(pygame.image.load(card_path).convert_alpha(), (CARD_WIDTH, CARD_HEIGHT))
        except FileNotFoundError:
            raise FileNotFoundError(f"[FATAL] Card image not found: {card_path}")
        except Exception as e:
            raise RuntimeError(f"[ERROR] Could not load image at {card_path}: {e}")
        self.rarity = rarity
        self.pokemon_type = pokemon_type
        self.set_index = set_index
