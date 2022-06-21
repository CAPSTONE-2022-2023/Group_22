### Reset Password (done by Niaz)

### Actor (User)
Customer creates a valid account in the system.

### Pre-conditions
The Customer is logged into the account. Information is stored in the database. 

### Main Flow
1. The Customer clicks on the **Forget Password** Button to reset the password.
2. The system asks the customer to enter an email address.  
3. The customer fills in the email field.
4. The system verifies the account exists with email and sends an email containing a one-time Password link.
5. The customer clicks the link and the new password window appears.
6. The customer fills in the password field.
7. The system validates passwords.
8. The customer clicks on the **Save** button.
9. The system sends **Password Changed** notification email to the customer. 


### Alternate Flows
* If a customer enters an incorrect password format:
    1. After step 7, the system prompts the customer to re-enter the correct password format.
* If a customer enters a non-registered email:
   1. The system displays a message indicating that this email has not been registered in our system.
* If customer clicks on expired password link:
   1.  After step 5, the system displays error message indicating that the link is valid for one-time use.
   
### Postconditions
After a customer has successfully changed the password, the database saves the information. The customer receives an email that the account password has been successfully changed.
