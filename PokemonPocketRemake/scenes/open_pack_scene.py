import pygame
from core.pack import Pack
from config.config import IMAGE_PATH


class OpenPackScene:
    def __init__(self, screen):
        self.screen = screen
        self.pack_image = pygame.image.load(IMAGE_PATH / 'eevee_grove_pack.png')
        self.pack = Pack()
        self.state = "waiting"
        self.current_index = 0

    def run(self):
        clock = pygame.time.Clock()
        while True:
            self.screen.fill((30,30,50))

            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    return "quit"
                if event.type == pygame.MOUSEBUTTONDOWN:
                    if self.state == "waiting":
                        self.state = "showing_cards"
                    elif self.state == "showing_cards":
                        self.current_index += 1
                        if self.current_index >= len(self.pack.cards):
                            self.state = "reveal_all"
                    elif self.state == "reveal_all":
                        return "home"

            if self.state == "waiting":
                self.screen.blit(self.pack_image, (300,200))
            elif self.state == "showing_cards":
                card = self.pack.cards[self.current_index]
                self.screen.blit(card.image, (250,150))
                #rarity_img = pygame.image.load(f"rarities{card_rarity}")
                #self.screen.blit(rarity_img, (350,450))
            elif self.state == "reveal_all":
                for i, card in enumerate(self.pack.cards):
                    x = 100 + (i % 3) * 200
                    y = 100 if i < 3 else 300
                    self.screen.blit(card.image, (x, y))

            pygame.display.flip()
            clock.tick(30)