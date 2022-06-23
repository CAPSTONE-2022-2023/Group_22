## Modify Personal Info (done by Hyungi)

### Actor (User)
User with a valid account in the system.

### Pre-conditions
User is logged into the system.

### Main Flow
1. The user clicks on the **Settings** button.
2. The system loads a dashboard that shows user's personal information and an **Edit** button on side.
3. The user clicks on the **Edit** button.
4. The system asks to enter user's password.
5. The user enters password and clicks on a **Next** button.
6. The system loads a form that is filled with the user's existing personal information.
7. The user modifies the existing personal information in the form then click **Finished** button.
8. The system displays a dashboard with the updated user's personal information.

### Alternate Flows
- If a user enters wrong password at step 5:
  1. After step 5, The system will let the user know that a wrong password was entered.
- If a user is missing a required information in a form:
  1. After step 7, The system will let the user know that the required information should be entered in the form.
- If a user entered an invalid information in a form(e.g. entering letters in **phone number** form):
  1. After step 7, The system will let the user know that the only valid information should be entered in the form.

### Postconditions
After a user submits the new personal information, the system's database gets updated with the updated information.
