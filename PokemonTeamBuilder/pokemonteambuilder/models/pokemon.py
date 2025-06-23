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
    def __init__(self, name: str, dex_id: int, types: list[str], image: str):
        """Creates the Pokemon object to be inserted into the database

        Args:
            name (_type_): Name of the Pokemon species
            dex_id (_type_): The national dex number of the Pokemon
            type (_type_): The types the Pokemon has, 
                           represented as a list of Type objects
            image (_type_): The image that will be used to display the Pokemon
        """
        self.name = name
        self.dex_id = dex_id
        self.types = types
        self.image = image

    # Returns Pokemon name
    def get_name(self):
        return self.name

    # Returns Pokemon id
    def get_id(self):
        return self.dex_id

    # Returns Pokemon types
    def get_types(self):
        return self.types
    
    # Returns Pokemon image
    def get_image(self):
        return self.image
    