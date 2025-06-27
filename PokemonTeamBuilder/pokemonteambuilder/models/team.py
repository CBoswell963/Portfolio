# Team class model

from pokemon import Pokemon

class Team:

    # Max number of pokemon a team can have
    MAX_POKEMON = 6

    # number of pokemon types
    TYPES = 18

    # list holding the type names
    type_names = [
        "normal", "fire", "water", "electric", "grass", "ice", "fighting", "poison",
        "ground", "flying", "psychic", "bug", "rock", "ghost", "dragon", "dark",
        "steel", "fairy"
    ]

    # list for mapping type names to index values
    type_to_index = {t: i for i, t in enumerate(type_names)}

    # 2d type chart for weaknesses
    type_chart = [
        [  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, -1,  0,  0,  0,  0 ], # normal
        [  0, -1,  1,  0, -1, -1,  0,  0,  1,  0,  0, -1,  1,  0,  0,  0, -1, -1 ], # fire
        [  0, -1, -1,  1,  1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1,  0 ], # water
        [  0,  0,  0, -1,  0,  0,  0,  0,  1, -1,  0,  0,  0,  0,  0,  0, -1,  0 ], # electric
        [  0,  1, -1, -1, -1,  1,  0,  1, -1,  1,  0,  1,  0,  0,  0,  0,  0,  0 ], # grass
        [  0,  1,  0,  0,  0, -1,  1,  0,  0,  0,  0,  0,  1,  0,  0,  0,  1,  0 ], # ice
        [  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1, -1, -1,  0,  0, -1,  0,  1 ], # fighting
        [  0,  0,  0,  0, -1,  0, -1, -1,  1,  0,  1, -1,  0,  0,  0,  0,  0, -1 ], # poison
        [  0,  0,  1, -1,  1,  1,  0, -1,  0,  0,  0,  0, -1,  0,  0,  0,  0,  0 ], # ground
        [  0,  0,  0,  1, -1,  1, -1,  0, -1,  0,  0, -1,  1,  0,  0,  0,  0,  0 ], # flying
        [  0,  0,  0,  0,  0,  0, -1,  0,  0,  0, -1,  1,  0,  1,  0,  1,  0,  0 ], # psychic
        [  0,  1,  0,  0, -1,  0, -1,  0, -1,  1,  0,  0,  1,  0,  0,  0,  0,  0 ], # bug
        [ -1, -1,  1,  0,  1,  0,  1, -1,  1, -1,  0,  0,  0,  0,  0,  0,  1,  0 ], # rock
        [ -1,  0,  0,  0,  0,  0, -1, -1,  0,  0,  0, -1,  0,  1,  0,  1,  0,  0 ], # ghost
        [  0, -1, -1, -1, -1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  1 ], # dragon
        [  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, -1,  1,  0, -1,  0, -1,  0,  1 ], # dark
        [ -1,  1,  0,  0, -1, -1,  1, -1,  1, -1, -1, -1, -1,  0, -1,  0, -1, -1 ], # steel
        [  0,  0,  0,  0,  0,  0, -1,  1,  0,  0,  0, -1,  0,  0, -1, -1,  1,  0 ] # fairy

    ]

    # Creates a team object, team name is automatically assigned based on current user's team count if none is provided
    def __init__(self, user):
        # unique id of user (implemented later)
        self.user = user
        self.attack_type_coverage = [0] * self.TYPES
        self.defense_type_coverage = [0] * self.TYPES
        self.pokemon_team = []

    # Creates a team based on the user's input
    def create_team(self, name, *pokemon: Pokemon):
        self.name = name
        if len(pokemon) > self.MAX_POKEMON:
            raise ValueError("A team can have a maximum of 6 Pokemon.")
        
        for p in pokemon:
            self.pokemon_team.append(p)

    # returns the pokemon in the team
    def return_team(self):
        return self.name, self.pokemon_team
    
    # update the pokemon in the team and resets type coverage
    def update_pokemon(self, *pokemon: Pokemon):
        if len(pokemon) > self.MAX_POKEMON:
            raise ValueError("A team can have a maximum of 6 Pokemon.")
        
        self.attack_type_coverage = [0] * self.TYPES
        self.defense_type_coverage = [0] * self.TYPES
        self.pokemon_team = pokemon

    # updates the team's name
    def update_name(self, name):
        self.name = name

    # returns a type coverage analysis as an int list based on the pokemon in the team
    def type_coverage_analysis(self):

        for pokemon in self.pokemon_team:
            # gets the index value of the type for use in analysis
            idx = self.type_to_index[pokemon.get_type_one().lower()]

            # loops through type chart at index and increments corresponding index in attack coverage
            for i in self.attack_type_coverage:
                self.attack_type_coverage[i] += self.type_chart[idx][i]

            # checks if pokemon has second type
            if( pokemon.get_type_two() is not None ):
                # loops through other side of type chart and de increments corresponding index in defense coverage
                for i in self.defense_type_coverage:
                    self.defense_type_coverage[i] -= self.type_chart[i][idx]


        return self.attack_type_coverage, self.defense_type_coverage