# Team class model

class Team:

    # Max number of pokemon a team can have
    MAX_POKEMON = 6

    # Creates a team object, team name is automatically assigned based on current user's team count if none is provided
    def __init__(self, user):
        # unique id of user (implemented later)
        self.user = user