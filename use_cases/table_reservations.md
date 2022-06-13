Table Reservations (done by Jackson)

Actor (User)
Customer with a valid account in the system of the restaurant. 

Pre-conditions
Customer is logged into the restaurant’s system.

Main Flows 
1.	The customer clicks on the table reservation icon on the restaurant’s website. 
2.	The system displays a list of dates when the restaurant is open. 
3.	The customer selects an available date.
4.	The system asks for the number of people.
5.	The customer inputs the number of people.
6.	The system loads and displays a list of available timeslots for the required number of people. 
7.	The customer selects the desired timeslot.  
8.	The system asks if the reservation is for a celebration and displays the type of celebrations available.
9.	The customer confirms and chooses the type of celebration. 
10.	The system asks the customer to confirm the reservation. 
11.	The customer confirms the reservation.
12.	The system displays the reservation details including the chosen date and timeslot, the number of people, and the type of celebration. 
13.	The system sends a confirmation email to the customer. 

Alternate Flow  
•	If the customer already has a reservation on the selected date:
	i.	After step 3, the system will let the customer know that he has already reserved a table on that date, and the previous reservation will be cancelled if he continues.
•	If no timeslots are available on the selected date:
	i.	After step 3, the system will tell the customer to select a different date. 
•	If no reservations are available for the required number of people on the selected date: 
	i.	After step 5, the system will inform the customer that no reservations are available for the required number of people on the selected date. 
•	If the customer replies that the reservation is not for a celebration:
	i.	In step 12, the system will not display the type of celebration.
•	If the customer does not confirm his/her choice:
	i.	After step 10, the system will go back to step 2.

Post Conditions 
After the customer confirms the table reservation, the restaurant’s database is updated with the information about the new reservation’s details, including the customer number, the chosen date and timeslot, the number of people, and the type of celebration if applicable. Besides, the customer receives a confirmation email about the reservation.
