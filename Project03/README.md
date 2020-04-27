# CS 1XA3 Project03 - Sharmd36
## Usage
Install conda enivornment from [here](https://www.anaconda.com/products/individual), then

Run locally with
`python manage.py runserver localhost:8000`

Run on [mac1xa3.ca](https://mac1xa3.ca/e/sharmd36/) with
`python manage.py runserver localhost:10093`

Log in with any username and password given given in **Objective 11**

## Objective 01
Description:
- this feature is displayed in `login.djhtml` which is rendered by `login_view`
- it makes a POST Request to `login_view` and either generates an empty form or generates `messages_view`

## Objective 02
- this feature is displayed in `messages.djhtml` which is rendered by `people_view` and `account_view`
- it makes a POST Request to `people_view` and redirects to `/e/sharmd36/messages`
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

# Objective 03
- this feature is displayed in `account.djhtml` which is rendered by `account_view` and `update_view`
- it makes a POST Request to `update_view` and either redirects to `/e/sharmd36/account`
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 04
- this feature is displayed in `people.djhtml` which is rendered by `people_view`
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 05
- this feature is displayed in `people.djhtml` which is rendered by `people_view`, `people.js` and `friend_request_view`    
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 06
- this feature is displayed in `people.djhtml` which is rendered by `accept_decline_view` 
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 07
- this feature is displayed in `messages.djhtml` which is rendered by `messages_view` and messages.js` 
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 08
- this feature is displayed in `messages.djhtml` which is rendered by `messages_view`, `messages.js` and `post_submit_view` 
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 09
- this feature is displayed in `messages.djhtml` which is rendered by `messages_view` and `more_post_view` 
_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

# Objective 10
- this feature is displayed in `messages.djhtml` which is rendered by `messages_view` and `like_view` 

_Exceptions:_
- If `/e/sharmd36/account` is called without authentication, it redirects it redirects to `login.djhtml`

## Objective 11
 The following list shows the current users, with their username and passwords.

|    Username   	| Password   	|
|:-------------:	|------------	|
| Kawhi_Leonard 	| Clippers.1 	|
| Paul_George   	| Clippers.2 	|
| Pascal_Siakam 	| Raptors.1  	|
| Steady_Freddy 	| Raptors.2  	|
| Matt_Thomas   	| Raptors.3  	|
| Anthony_Davis 	| Lakers.1   	|
| Lebron_James  	| Lakes.2    	|
| Devin_Booker  	| Suns.1     	|
| Kevin_Durant  	| Nets.1     	|
| Kyrie_Irving  	| Nets.2     	|

- Kawhi_Leonard and Paul_George are friends.
- Pascal_Siakam and Steady_Freddy are friends.
- Pascal_Siakam and Matt_Thomas are friends.
- Matt_Thomas and Steady_Freddy are friends.
- Anthony_Davis and Lebron_James are friends.
- Kevin_Durant and Kyrie_Irving are friends.

* Kyrie_Irving has sent Lebron_James a friend request.
* Kawhi_Leonard has sent Pascal_Siakam and Steddy_Freddy a friend request.

- Kyrie_Irving has made a post that Kevin_Durant and Devin_Booker have liked.
- Pascal_Siakam has made a post that Steady_Freddy and Matt_Thomas have liked.

All default users have an employment, location, birthday and two interests. 

