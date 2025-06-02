Name:  Type Coverage Analysis;

Description:  User selects a team and a visual representation is provided for the team's type coverage, one for offense and defence with gaps highlighted.

Goal:  Team is accurately analyzed for type effectiveness and accurate chart is hown based on current covergae, with recommendations on what gaps to cover

Actor: User

Pre-conditions:  App is operational, User is registered and logged in, User has a team created and saved

Post-conditions:  Visual is created for the selected team and user has the option to go straight to editing interface for selected team

Basic Flow:

    Type Coverage Analysis (UC3):

    Precondition:  A team is saved to the account

    User selects option to view existing teams

    User is displayed list of saved teams

    User finds a team and selects option to analyze the type coverage

    App analyzes the types currently in the team, their strengths and their weaknesses

    App displays two charts, one for types the team is effective in attacking and one for types the teams is effective in defending against

    For the offensive chart, the value next to a type increases by one if a type on a pokemon is strong against it and decreases by one if a type on a pokemon is weak against it

    For the defensive chart, the value next to a type increases by one if a type on a pokemon is resistant to it and decreases by one if a type on a pokemon is weak to it

    If a value next to a type is negative and is greater than half the team size, the system will recommend adding a type strong against said type