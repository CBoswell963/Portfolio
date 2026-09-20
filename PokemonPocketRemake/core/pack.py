import random
from core.pokemon_card import PokemonCard
from database.db_connect import get_random_card_by_rarity

class Pack:
    def __init__(self):
        self.cards = []
        self.load_cards()

    def load_cards(self):
        # 3 one diamond rarity cards
        for _ in range(3):
            card = get_random_card_by_rarity("one_diamond")
            if not card:
                rarity = "one_diamond"
                print(f"[ERROR] No card found for rarity '{rarity}'")
            elif not hasattr(card, 'card_image') or card.card_image is None:
                print(f"[ERROR] Card has no image loaded: {card}")
            else:
                self.cards.append(card)

        # 1 card of two diamond rarity or higher
        random_rarity = round(random.random(), 5)
        rarity = ""

        if random_rarity < 0.0004:
            rarity = "crown"
        elif .0004 <= random_rarity < .00373:
            rarity = "two_rainbow_star"
        elif .00373 <= random_rarity < .01087:
            rarity = "rainbow_star"
        elif .01087 <= random_rarity < .01309:
            rarity = "three_star"
        elif .01309 <= random_rarity < .01809:
            rarity = "two_star"
        elif .01809 <= random_rarity < .04381:
            rarity = "one_star"
        elif .04381 <= random_rarity < .06047:
            rarity = "four_diamond"
        elif .06047 <= random_rarity < .10999:
            rarity = "three_diamond"
        elif .10999 <= random_rarity < 1:
            rarity = "two_diamond"

        card = get_random_card_by_rarity(rarity)
        if not card:
            print(f"[ERROR] No card found for rarity '{rarity}'")
        elif not hasattr(card, 'card_image') or card.card_image is None:
            print(f"[ERROR] Card has no image loaded: {card}")
        else:
            self.cards.append(card)

        # 1 card of two diamond rarity or higher
        random_rarity = round(random.random(), 5)
        if random_rarity < 0.0004:
            rarity = "crown"
        elif .0004 <= random_rarity < .00373:
            rarity = "two_rainbow_star"
        elif .00373 <= random_rarity < .01087:
            rarity = "rainbow_star"
        elif .01087 <= random_rarity < .01309:
            rarity = "three_star"
        elif .01309 <= random_rarity < .01809:
            rarity = "two_star"
        elif .01809 <= random_rarity < .04381:
            rarity = "one_star"
        elif .04381 <= random_rarity < .06047:
            rarity = "four_diamond"
        elif .06047 <= random_rarity < .10999:
            rarity = "three_diamond"
        elif .10999 <= random_rarity < 1:
            rarity = "two_diamond"

        card = get_random_card_by_rarity(rarity)
        if not card:
            print(f"[ERROR] No card found for rarity '{rarity}'")
        elif not hasattr(card, 'card_image') or card.card_image is None:
            print(f"[ERROR] Card has no image loaded: {card}")
        else:
            self.cards.append(card)

        print(card.card_name)

        random.shuffle(self.cards)