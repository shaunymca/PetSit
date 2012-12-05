#PetSitting Admin App  
##Done  

* Sign up, login
* Subscription
* User Roles
* Add clients to database  
* Implemented turbolinks, speeding up the application greatly.

##Todo  

* Finish up clients view  
** ~~Add pagination and search to client index~~  
*** ~~Make pagination look pretty awesome~~  
** ~~Make the "show" client page better~~  
** Add map to "show" client page, or link, whatever.  
* Design:  
** ~~Responsive navbar~~  
** ~~Responsive forms~~  
** Better background  
** Logo  
* Create pricing profiles that work  
** Create default pricing table for users  
** Have default pricing automatically applied to clients when they are created (client pricing table)  
** Allow users to edit client pricing table  
* Create new "visits" table  
** Have users input date and type of visit (eg June 1, afternoon OR June 1, birds)  
** Pricing will automatically update based on day of the week and type of visit that coorosponds to the client's pricing table  
** The price feild can be adjusted or changed by the user before or after it is saved  
** Add ability to mark visits as paid or unpaid  
* Create the invoicing functionality  
** Take unpaid visits and add them to the invoice.  
** Add ability to mark invoice as paid/unpaid. When marked "paid" this will update all of the visits as well.  