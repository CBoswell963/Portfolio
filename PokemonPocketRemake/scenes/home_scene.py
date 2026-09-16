import pygame

class HomeScene:
    def __init__(self, screen):
        self.screen = screen
        self.font = pygame.font.SysFont("comicsans", 40)
        self.open_button = pygame.Rect(300, 200, 200, 60)
        self.view_button = pygame.Rect(300, 300, 200, 60)

    def run(self):
        while True:
            self.screen.fill((50, 50, 80))
            pygame.draw.rect(self.screen, (100, 200, 100), self.open_button)
            pygame.draw.rect(self.screen, (200, 100, 100), self.view_button)

            open_text = self.font.render("Open Pack", True, (0, 0, 0))

            view_text = self.font.render("View Collection", True, (0, 0, 0))

            self.screen.blit(open_text, (self.open_button.x + 20, self.open_button.y + 15))
            self.screen.blit(view_text, (self.view_button.x + 10, self.view_button.y + 15))

            pygame.display.flip()

            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    return "quit"
                if event.type == pygame.MOUSEBUTTONDOWN:
                    if self.open_button.collidepoint(event.pos):
                        return "open_pack"
                    elif self.view_button.collidepoint(event.pos):
                        pass