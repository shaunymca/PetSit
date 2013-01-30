#PetSitting Admin App  
##Done  

* Sign up, login  
* Subscription  
* User Roles  
* Add clients to database  
* Implemented turbolinks, speeding up the application greatly.  
* Finish up clients view (with maps!)  
* Allow uploading of clients as csv or excell

##Todo  
* Design:  
** ~~Responsive navbar~~  
** ~~Added dropdown in navbar with links for clients (bootstrap)~~  
** ~~Responsive forms~~  
** ~~Better background~~  
** ~~Added in @font-face support and fonts~~  
** Logo  
* UI  
** On login, go to user settings and set default pricing.  
* Create pricing profiles that work  
** ~~Create default pricing table for users~~  
*** ~~client_id:integer, visit_type:string, price:decimal~~ 
** ~~Have default pricing automatically applied to clients when they are created (client pricing table)~~  
** ~~Head back to user's edit page after adding default pricing (or any edit to users page~~  
** Allow users to edit client pricing table(rethinking how this is done)  
* Create new "visits" table  
** Have users input date and type of visit (eg June 1, afternoon OR June 1, birds)  
** Pricing will automatically update based on day of the week and type of visit that coorosponds to the client's pricing table  
** The price feild can be adjusted or changed by the user before or after it is saved  
** Add ability to mark visits as paid or unpaid  
* Create the invoicing functionality  
** Take unpaid visits and add them to the invoice.  
** Add ability to mark invoice as paid/unpaid. When marked "paid" this will update all of the visits as well.  
** On Invoice creation, download a pdf of the invoice  
 