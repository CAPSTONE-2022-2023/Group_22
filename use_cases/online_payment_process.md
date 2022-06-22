**Online Payment Process (done by Jackson)**

**Actor (User)**

Customer with a valid account in the system of the restaurant.

**Pre-conditions**

Customer is logged into the restaurant's system for online payment.

**Main Flows**

1.  The customer clicks on the online payment icon on the restaurant's
    website.

2.  The system displays the required payment amount and asks for
    confirmation.

3.  The customer confirms the payment amount.

4.  The system asks for the optional tip percentage.

5.  The customer inputs the desired tip percentage.

6.  The system displays the total amount including the tip and a list of
    available online payment options.

7.  The customer selects the credit card payment option.

8.  The system asks the customer to input his credit card information.

9.  The customer inputs his name, credit card number, expiry date, and
    CVV number.

10. The system processes and confirms the payment.

11. The system sends the receipt to the customer through email.

**Alternate Flow**

-   If the customer does not confirm the payment amount:

    i.  After step 3, the system will go back to the main page of the
    website.

-   If the customer chooses to skip the tip:

    i.  After step 5, the system will go to step 6.

-   If the customer chooses to use PayPal:

    i.  In step 8, the system displays a page informing the customer
        that he will be directed to PayPal and pops-up a window for him
        to login his PayPal account.

    ii. In step 9, the customer chooses his desired payment method in
        PayPal and confirms the payment.

    iii. In step 10, the customer will be redirected back to the system
         where it will confirm the payment.

-   If the payment is unsuccessful:

    i.  After step 10, the system will display an error message and go
        back to step 6.

**Post Conditions**

After the online payment process is completed, the restaurant's database
is updated with the customer's payment details including the total
payment amount and the payment method. The customer receives a receipt
through email for the payment.
