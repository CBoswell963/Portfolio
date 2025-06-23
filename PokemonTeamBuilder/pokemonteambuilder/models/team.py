# Team class model

from pokemon import Pokemon

class Team:

    # Max number of pokemon a team can have
    MAX_POKEMON = 6

    # Creates a team object, team name is automatically assigned based on current user's team count if none is provided
    def __init__(self, user):
        # unique id of user (implemented later)
        self.user = user
        self.pokemon_team = []

    # Creates a team based on the user's input
    def create_team(self, name, *pokemon: Pokemon):
        self.name = name
        if len(pokemon) > self.MAX_POKEMON:
            raise ValueError("A team can have a maximum of 6 Pokemon.")
        
        for p in pokemon:
            self.pokemon_team.append(p)

    def return_team(self):
        return self.name, self.pokemon_team
    
    def update_pokemon(self, *pokemon: Pokemon):
        if len(pokemon) > self.MAX_POKEMON:
            raise ValueError("A team can have a maximum of 6 Pokemon.")
        
        self.pokemon_team = pokemon

    def update_name(self, name):
        self.name = name

