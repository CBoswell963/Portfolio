Name:  Team Creation and Editing;

Description:  Allow users to create a Pokemon team of a selected team size and displays the images, names and descriptions of the Pokemon in the team

Goal:  User successfully creates and saves a team of a specified size

Actor: User

Pre-conditions:  App is operational, User is registered, logged in and at navigation page

Post-conditions:  User can create and save teams which they can access and edit once they authenticate upon returning

Basic Flow:

    Team Creation (UC2):
        User selects option to create new team

        User is prompted to select team size between 1 and 6

        Once selected user is taken to page which displays empty team slots corresponding to the teams size

        User selects pokemon to add from drop down box below team slot.  User can either manually search or type in Pokemon name.

        Once a pokemon is selected its image is shown above the drop down box along with its name and type/s

        User continues to add/change Pokemon until team is full

        User selects save team option

        User is prompted to give team a name, with Team X (X being the number team it is) being the default name

        User confirms team name and team is saved to account under the chosen name

Alternate Flows:

    Team Editing Same Size (AC4):

    Preconditions:  A team is saved to the account

        User selects option to view existing teams

        A list of saved teams is shown to the user, with each team showing the name of the team, a small image of the pokemon in the team and the names of the pokemon

        The user finds a team from the list and chooses the edit option next to the team

        The user is prompted if they want to change the team size

        The user decides to keep team size the same

        The user is taken to the team creation page with the pokemon from the selected team preloaded

        The user selects a pokemon/s from the team and changes it

        The user selects the save team option

        User is prompted to give team a name, with the team's current name being the default

        The user is taken back to the list of teams and the selected team is updated with the current Pokemon and name

    Team Editing Bigger Size (AC5):

    Preconditions:  A team is saved to the account with a size less than 6

        User selects option to view existing teams

        A list of saved teams is shown to the user, with each team showing the name of the team, a small image of the pokemon in the team and the names of the pokemon

        The user finds a team from the list with a size less than 6 and chooses the edit option next to the team

        The user is prompted if they want to change the team size

        The user selects to change the teams size

        The user selects a team size greater than the current team size

        The user is taken to the team creation page with the pokemon from the selected team preloaded and with empty slots for the new team size

        The user selects a pokemon/s from the team and changes it

        The user selects pokemon to add to the empty slots

        The user selects the save team option

        User is prompted to give team a name, with the team's current name being the default

        The user is taken back to the list of teams and the selected team is updated with the current Pokemon and name


    Team Editing Smaller Size (AC6):

    Preconditions:  A team is saved to the account with a size greater than 1

        User selects option to view existing teams

        A list of saved teams is shown to the user, with each team showing the name of the team, a small image of the pokemon in the team and the names of the pokemon

        The user finds a team from the list with a size greater than 1 and chooses the edit option next to the team

        The user is prompted if they want to change the team size and if so to what size

        The user selects to change the teams size

        The user selects a team size smaller than the current team size

        The user is taken to the team creation page with the pokemon from the selected team preloaded down to the chosen team size

        The user selects a pokemon/s from the team and changes it

        The user selects the save team option

        User is prompted to give team a name, with the team's current name being the default

        The user is taken back to the list of teams and the selected team is updated with the current Pokemon and name


    Saving Invalid Team (AC7):

        User selects option to create new team

        User is prompted to select team size between 1 and 6

        Once selected user is taken to page which displays empty team slots corresponding to the teams size

        User selects pokemon to add from drop down box below team slot.  User can either manually search or type in Pokemon name.

        Once a pokemon is selected its image is shown above the drop down box along with its name and type/s

        User continues to add/change Pokemon until team has one slot remaining

        User selects save team option

        System tells user that the team is not full and to finish adding pokemon

    Team Deletion (AC8):
        User selects option to view existing teams

        A list of saved teams is shown to the user, with each team showing the name of the team, a small image of the pokemon in the team and the names of the pokemon

        The user finds a team from the list and chooses the delete option next to the team

        The system prompts the user if they are sure they want to delete the team

        The user confirms they want to delete the team

        The user is taken back to the team list and the team is erased from both the account and the list

    Team Deletion Deny (AC9):
        User selects option to view existing teams

        A list of saved teams is shown to the user, with each team showing the name of the team, a small image of the pokemon in the team and the names of the pokemon

        The user finds a team from the list and chooses the delete option next to the team

        The system prompts the user if they are sure they want to delete the team

        The user confirms they do not want to delete the team

        The user is taken back to the team list and no change is made to the account or list

    Team Limit Reached (AC10):

    Precondition:  Max number of teams made
        User selects option to create new team

        System displays message that max team limit is reached and requests user to delete teams before making more

    Saving a team as a Guest (AC11):
    
        User selects option to enter app as a guest

        User is taken to main page

        User selects option to create new team

        User is prompted to select team size between 1 and 6

        Once selected user is taken to page which displays empty team slots corresponding to the teams size

        User selects pokemon to add from drop down box below team slot.  User can either manually search or type in Pokemon name.

        Once a pokemon is selected its image is shown above the drop down box along with its name and type/s

        User continues to add/change Pokemon until team is full

        User selects save team option

        User is prompted to give team a name, with Team X (X being the number team it is) being the default name

        User confirms team name and team is temporarily saved under the chosen name

        User exits the app

        User re enters the app as a guest

        User selects option to view saved teams

        No teams are shown