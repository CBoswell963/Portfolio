import pygame
import traceback
from scenes.home_scene import HomeScene
from scenes.open_pack_scene import OpenPackScene
from config.config import SCREEN_WIDTH, SCREEN_HEIGHT

pygame.init()
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Pokemon Pocket TCG Remake")

scene = HomeScene(screen)

running = True
while running:
    try:
        next_scene = scene.run()
    except Exception:
        traceback.print_exc()
        running = False
    if next_scene == "open_pack":
        scene = OpenPackScene(screen)
    elif next_scene == "home":
        scene = HomeScene(screen)
    elif next_scene == "quit":
        running = False

pygame.quit()