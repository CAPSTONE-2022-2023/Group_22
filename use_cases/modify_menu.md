### Create Account (done by Alireza Zahedi)

### Actor (Superuser)
Superuser modifies the menu by creating/deleting a meal

### Pre-conditions
The superuser is logged in to the system and therefore has the superuser access token.

### Main Flow
1. Superuser clicks on **"Modify"** option from the navigation bar.
2. System shows a list of options **(CRUD)**.
3. If superuser selects the **"Create"** option.
  <br/>3.1. System renders a form containing required fields for a meal to be added to the database.
  <br/>3.2. Superuser fills the form and submits.
4. If superuser selects the **"Delete"** option.
  <br/>4.1 System renders a list that contains all meals in the database.
  <br/>4.2 Superuser selects one or more meals then clicks on **"Done"**.
5. Request is sent to the server and a confirmation message is shown to the superuser.
  

### Alternate Flows
* Superuser creates a meal which already exists in the database.
<br/>Only a message is shown on the screen to let the superuser know that no new meal is added to the database.
* Superuser token expires for some reason while Superuser is modifying the menu
<br/>A message will appear on the screen and the user is logged out
* Superuser attempts to see meals for deletion, but there are no meals in the database
<br/>System shows an appropriate message and redirects the Superuser to the **CRUD** page
   
### Post-conditions
Meals are persisted in the database and the newly added meal(s) will be visible to customers in the main menu.
