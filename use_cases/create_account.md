### Create Account (done by Niaz)

### Actor (User)
Customer create a valid account in the system.

### Pre-conditions
The Customer is logged into the account. No customer has created two accounts and the information is stored in the database. 

### Main Flow
1. The Customer clicks on the **create account** button to create a new account.
2. The system brings up a registration form.
3. The customer fills out all mandatory fields in the registration form and enters a valid password. 
4. The customer reviews and accepts the Term of Use and Privacy statement.
5. The customer clicks the **Submit** button.
6. The system validates the entered data and sends an email containing a link to activate the account.
7. The customer clicks the activation link and login to the account.
8. The system sends an Welcome email. 

### Alternate Flows
* If a customer enters invalid information:
    1. The system prompts the customer to re-enter valid information.
* If customer accounts exists:
   1. The system displays a message indicating that this account is already exists. 
* If the password is not long or complex enough:
   1.  The system prompts the customer to re-enter the minimum length and complexity standard password. 
   
### Postconditions
After a customer has successfully created an account, the database saves the information. The customer receives an email with a confirmation. 


