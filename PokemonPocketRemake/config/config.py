# config.py
"""
    File for configuring paths and fixed variables
"""

from pathlib import Path

# Config file path
BASE_DIR = Path(__file__).resolve().parent.parent

# Database and Configuration
DATABASE_PATH = BASE_DIR / "database/pocket_tables.sqlite"

# Pygame Window Settings
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 1200
FPS = 60

# Asset paths
ASSET_PATH = BASE_DIR / "assets"
IMAGE_PATH = ASSET_PATH / "images"
FONT_PATH = ASSET_PATH / "fonts"
CARD_IMAGE_PATH = IMAGE_PATH / "card_images"

# Debugging
DEBUG_MODE = False