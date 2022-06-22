
### Delete Account (done by Alireza Zahedi)

### Actor (User/Customer)
User tries to delete their account.

### Pre-conditions
The user is logged in to the system and has a valid token.

### Main Flow
1. User clicks on the settings option in the application.
2. Application shows user's dashboard and the **"Delete account"** option at the bottom.
3. User clicks on the **"Delete account"** option.
4. Application asks for the password.
5. User enters the password.
6. Application asks for confirmation.
7. User cofirms the action.
8. Application sends a request and deletes the user's account from the database, user is then logged out of the application and directed to th the main screen of the application.


### Alternate Flows
    1. User doesn't confirm account-deletion action.
    2. The account will remain intact in the database.
    
    1. User enters a wrong password.
    2. Application asks for the correct password and logs them out if they keep entering the wrong password.
    
    1. User's account is already deleted from other devices or by superusers.
    2. User is logged out of the application and directed to the main screen.
    
    1. Server is down.
    2. User is notified and the account will not be removed from the database.

   
### Post-conditions
Customer's account along with all of its data are deleted from the database.
