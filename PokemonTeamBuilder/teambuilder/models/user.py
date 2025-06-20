# User class model

class User:


    # Max number of teams a user can have
    MAX_TEAMS = 100

    # Creates a user object
    def __init__(self, username, password):
        # unique id of user (implemented later)
        self.id = 0
        self.username = username
        self.password = password
        self.teams = []