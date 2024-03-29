## Online Ordering (done by Hyungi)

### Actor (User)
Customer with a valid account in the system.

### Pre-conditions
Customer is logged into the system.

### Main Flow
1. The customer clicks on the **Online Order** tab.
2. The system loads a list of available restaurants.
3. The customer clicks on a restaurant.
4. The system displays available menus of the selected restaurant.
5. The customer clicks on items he/she wants.
6. The system displays available options for the menu.
7. The customer selects the options he/she wants then click on **Add to Cart** button.
8. The system displays the number of items in the cart, the subtotal, and **My Cart** button on the bottom side of the app.
9. The customer clicks on the **My Cart** button if satisfied. If the customer wants to add more items, he/she can repeat from step 5.
10. The system displays the list of chosen items and Subtotal, and asks to choose the delivery method, address for the delivery, payment method, and tip amount.
11. The customer selects delivery method, address, payment method, and enters the tip amount, then clicks on **Apply** button. If needed, the customer can remove items by clicking **remove** button on each item.
12. The system updates the customer's selection and displays Order details(including Subtotal, Delivery Fee, Service Fee, Total), and asks the customer to confirm.
13. After the customer confirms the order, the system displays the order summary.
14. The system sends the order summary to the customer's email.


### Alternate Flows
- If a customer selects the other restaurant's item:
  1. After step 7, The system will let the customer know that one order can be made only within the same restaurant.
- If a customer does not have a payment method registered in the account:
  1. After step 9, the system will ask the customer to enter the payment detail.
- If a customer does not have any address registered in the account:
  1. After step 9, the system will ask the customer to enter a new address.
- If a customer does not confirm his/her order:
  1. After step 12, the system will allow the customer to modify the order, effectively sending him/her back to step 11.


### Postconditions
After a customer confirms the order, the database gets updated with the information about the order. The restaurant will get informed of the order by the app and email.
