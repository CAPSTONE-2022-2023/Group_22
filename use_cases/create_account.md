### Create Account (done by Niaz)

### Actor (User)
Customer create a valid account in the system.

### Pre-conditions
The Customer is logged into the account. No customer has created two accounts and the information is stored in the database. 

### Main Flow
1. The Customer clicks on the **create account** button to create a new account.
2. The system brings up a registration form.
3. The customer fills out all mandatory files in the registration form and enters a valid password. 
4. The customer reviews and accepts the Term of Use and Privacy statement.
5. The customer clicks the **Submit** button.
6. The system validates the entered data and sends an email containing a link to activate the account.
7. The customer clicks the **activation link** and login to the account.

### Alternate Flows
. If customer accounts exists
   - The system displays a message indicating that this account is already exists.


### Postconditions
After a customer has successfully created an account, the database saves the information. The customer receives an email with a confirmation. 


