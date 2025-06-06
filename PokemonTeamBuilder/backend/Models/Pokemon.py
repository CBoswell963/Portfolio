# Pokemon class model

class Pokemon:

    # Creates a Pokemon object
    def __init__(self, name, id, types, image):
        self.name = name
        self.id = id
        self.types = types
        self.image = image

    # Returns Pokemon name
    def get_name(self):
        return self.name

    # Returns Pokemon id
    def get_id(self):
        return self.id

    # Returns Pokemon types
    def get_types(self):
        return self.types
    
    # Returns Pokemon image
    def get_image(self):
        return self.image