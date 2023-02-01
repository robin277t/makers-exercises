make sure correct file structure in place, include different test folders, and a public file for images etc

MVP
1 - Page design from user stories done
2 - Database structure design done
3 - Seed and re-seed data done
4 - Model and Repo classes tested and built done
9 - Signup duplicate data clash check done
5 - Create homepage (all reverse time view) done
6 - Create signup form done
7 - Create post a peep form including timestamp (done)
10 - Login and Logout (sessions) (done)
12 - Accounts page- update details, delete a peep
1 - Encrypted passwords 
8 - All tests for above are thorough and working 
2 - Installation instructions
11 - Show tagged people in tweet with hyperlink to their page 

Nice to have

0 - Add homepage link on all pages to allow escape 30
1 - CSS styling 120
2 - Tagging a person in a peep (alterations to peep class and 3x pages showing peeps) 30
3 - Basic bounding of input data for security
4 - Render deploy 30
3 - Replying to a peep someone else made 120
5 - Integrating automatic email from tags 120
7 - Move from Repository classes to ActiveRecord 180


Routes:
1. get '/'
   - If not logged in returns 'home' page with signup+login buttons
    and list of recent peeps (show_all_peeps method) with hyperlink to person peeps
   - If logged in returns 'peeps' page with user details and logged in status noted at top or side of page, list of peeps (show_all_peeps method), with user hyperlinks, 1 form box ([POST] a peep), 1x logout button (which logs out and redirects to homepage) and 1x account actions button which takes you to account page

2. get '/account'
    - If not logged in redirects to signup/login page ('signuplogin')
    - If logged in shows 'account' page (show_your_peeps method) and update account details form [POST]and buttons,(with warning, perhaps 2nd data entry of password, and which adjusts login session data!) and also peep deletion button

3. get '/signup'
    -Only accessable if not logged in, if logged in redirect to peeps page
    - displays form with user fields [POST] into data, then redirects to signup success page if passes add user method tests, also logs in
    - redirects to close match page 'signup fail' if data incorrect [POST] form then called again on loop

4. get '/login'
    -Only accessable if not logged in, if logged in redirect to peeps page
    - displays form with user fields [POST], then redirects to login success page if passes check view_user method tests, - returns close match page 'login fail' if data incorrect [POST] form then called again on loop

5. post '/'
    if not logged in returns redirect to signup/login page
    if logged in takes form values from get '/' option2
        executes add peep method, and returns peep post success page

6. post '/signup'
    takes form data from signuplogin page and runs add_user method. if data clash then redirect to signupfail page, which is basically the same, run post route on this page until success, then return signupsuccess page

7. post '/login'
    takes form data from signuplogin page and runs view_user method. if data clash then redirect to loginfail page, which is basically the same, run post route on this page until success, then return loginsuccess page

8. post'/logout'
    - only works if logged in
    - alters session data to be logged out and returns logout success page

9. post '/account'
    -only works if logged in
    - takes form data and calls relevant update methods, returns accountupdated page on success


10. get '/deletepeep
    - only works if logged in
    returns 'deletepeep' page with list of your peeps when button pressed on account page and form [POST] for which to delete

11. post '/deletepeep'
    takes form data and calls deletepeep, (if match is entered) then redirects to 'peepdeleted' page

12. get '/personpeeps'
    available with or without login, just routes to a similar page to /account and shows just the peeps of the person clicked on, nothing else, page has route button to 'get '/'




Views:
-homepage
-peepspage
-signuploginpage
-loginfail
-signupfail
-account
-loginsuccess
-signupsuccess
-postsuccess
-logoutsuccess
-deletepeep
-peepdeleted
-accountupdated


NOTES:

There are 2x tests which check a new time has been grabbed and inserted correctly into data, because of the slight difference between times of database insertion and testing, the seconds and miliseconds have been lopped off the comparison. However, this will occasionally result in a failed test because the grab and test are either side of a minute boundary.
