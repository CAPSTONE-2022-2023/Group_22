Table Reservation (done by Niaz)

### Actor (User)
Customer with a valid account in the system.

### Pre-conditions
The Customer is logged into the system. No other customer has already picked the table and the information is stored in the restaurant database. 

### Main Flow
Customer logins directly to the system.
The system loads a list of table availability.
The customer will choose the table and request to reserve it. 
The system will book the table requested and ask for payment if it is a weekend or during peak business hours. 
The customer will make the payment.
The system verifies the account information, and sends the confirmation of the reserved table. 
The customer gets the confirmation number. 

### Alternate Flow
If no suitable table is available:
The system will let the customer choose another table.

If no one shows up for reservation:
The system will update the table availability and charge a fee.

### Postconditions
After a customer has successfully received the table, the database gets updated with the reservation information. The customer receives an email with a confirmation number. 



