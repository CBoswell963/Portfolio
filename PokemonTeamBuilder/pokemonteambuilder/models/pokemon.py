"""
    pokemon.py

    This module contains the Pokemon class and its related methods
"""


class Pokemon:
    """
    The Pokemon class implements the details of the Pokemon
    such as identifiers like name and pokedex number, its types and the image
    it outputs.  Once the pokemon object is made, it should not require editing
    so the class only requires methods for accessing the values of the object.
    """
    def __init__(self, name: str, dex_id: int, type_one: str, type_two: str, image: str):
        """Creates the Pokemon object to be inserted into the database

        Args:
            name (_type_): Name of the Pokemon species
            dex_id (_type_): The national dex number of the Pokemon
            type_one (_type_): The first type the Pokemon has,
            type_two (_type_): The second type a Pokemon may have,
            image (_type_): The image that will be used to display the Pokemon
        """
        self.name = name
        self.dex_id = dex_id
        self.type_one = type_one
        self.type_two = type_two
        self.image = image

    # Returns Pokemon name
    def get_name(self):
        return self.name

    # Returns Pokemon id
    def get_id(self):
        return self.dex_id

    # Returns Pokemon first type
    def get_type_one(self):
        return self.type_one

    # Returns Pokemon second type
    def get_type_two(self):
        return self.type_two
    
    # Returns Pokemon image
    def get_image(self):
        return self.image
    