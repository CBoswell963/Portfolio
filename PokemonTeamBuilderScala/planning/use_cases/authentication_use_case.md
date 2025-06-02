Name:  User Registration and Authentication;

Description:  Allow users to create an account, log in, and securely access their saved Pokemon teams.

Goal:  User successfully creates account and their authentication details are saved and encrypted.

Actor: User

Pre-conditions:  App is operational

Post-conditions:  User can create and save teams which they can access and edit once they authenticate upon returning

Basic Flow:

    Account Creation (UC1):
        User opens up the app and is shown three options:  Login, Guest, Create Account

        User selects the Create Account option

        User is taken to a page which prompts the User to enter a Username in the first textbox,
        a password in the second text box, and to re enter the same password in the third text box.  The page includes a create account button for when all the information is entered.

        User enters desired Username, desired password and re enters the same password.  They then click
        the create account button.

        System returns to login page and displays a message saying the account was successfully created if there were no issues.  Message is displayed below buttons and will disappear when users return to the login page after leaving.  Users login credentials are stored with password hash encryption.

        User selects the Login button.

        User is taken to page to enter Login information and then press login

        User enters login credentials and clicks login button

        User is taken to App's main navigation page upon successful login

        User can then use the app and have their team saved to their account

Alternate Flows:

    Guest Login (AC1):
        User opens up the app and is shown three options:  Login, Guest, Create Account

        User selects the Guest option

        User is taken to App's main navigation page

        User can create, edit and save teams

        Upon exiting app, all team data is cleared

    User Already Exists (AC2):

    Preconditions:  User account is already registered

        User opens up the app and is shown three options:  Login, Guest, Create Account

        User selects the Create Account option

        User is taken to a page which prompts the User to enter a Username in the first textbox,
        a password in the second text box, and to re enter the same password in the third text box.  The page includes a create account button for when all the information is entered.

        User enters desired Username, desired password and re enters the same password.  The information matches a user already registered in the system.  They then click he create account button.

        User stays on the same page and a message displays saying the user already exists.  Message disappears once user leaves create account page
    
    Incorrect Login (AC3):

    Precondition:  User account is already registered

        User opens up the app and is shown three options:  Login, Guest, Create Account

        User selects Login button

        User is taken to Login page

        User enters authentication credentials that do not match any registered credentials

        User remains on Login page and a message displays saying the login credentials were incorrect