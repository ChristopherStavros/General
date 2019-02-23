# OAuth

## Why does it exist?

- No one like creating accounts
- Most everyone has a social media account
- People like the idea of "log in with"


## Sharing your social media password?

- This does not happen
- Ask Twitter to generate a **unique token** and that is shared instead

## How does "log in with Twitter" work?

- First, your application tells Twitter "we're going to try to log in a user"
- Twitter generates a small unique number (the **"request token"**) so it doesn't get confused (e.g. if two users try to log in at the same time coming from your website)
- The user then authorizes log in via Twitter by clicking the button
- Twitter generates an **authorization code** for the specific log in
- Our application then receives the code
- We code the code to Twitter, and they generate a long random number which is the **"access token"**
- Whenever we make a request to Twitter, if we put this number in it, Twitter will know we represent this user (so we can e.g. get their followers, or Tweets they have created, etc.) 

### The authorization code

- Our application receives the authorization code in one of two ways: 
  - The user gets redirected to our application , and Twitter includes in that request the authorization code
  - The user manually enters a PIN code, if our application is not a web application (e.g. it is a console application)

## Python app summary

1. www.ourwebsite.com - login with Twitter
1. They press "sign in" or "authorize"
1. Twitter needs to send them back to e.g. www.ourwebsite.com/auth
1. We get that auth code + request token -> twitter -> access token

### Libraries

```python
import constants
import oauth2
import urllib.parse as urlparse
import json
```

### Create a consumer, which uses CONSUMER_KEY and CONSUMER_SECRET to identify our app uniquely

```python
consumer = oauth2.Consumer(constants.CONSUMER_KEY, constants.CONSUMER_SECRET)
```

### Create a client with our consumer(our app) and use the client to perform a request for the request token

```python
client = oauth2.Client(consumer)
response, content = client.request(constants.REQUEST_TOKEN_URL, 'POST')
if response.status != 200:
    print("An error occurred getting the request token from Twitter!")
```

### Get the request token parsing the query string returned

```python
request_token = dict(urlparse.parse_qsl(content.decode('utf-8')))
```

### Ask the user to authorize our app and give us the PIN code

- Gets currently logged in Twitter user and generates PIN code for that user
- If we had a web application, Twitter would send us this oauth verifier but since this is a console application we need to retrieve the PIN manually

```python
print("Go to the following site in your browser:")
print("{}?oauth_token={}".format(constants.AUTHORIZATION_URL, request_token['oauth_token'])) 
oauth_verifier = input("What is the PIN? ")
```

### Create Token object that contains the request token, and the verifier

```python
token = oauth2.Token(request_token['oauth_token'], request_token['oauth_token_secret'])
token.set_verifier(oauth_verifier)
```

### Create a client with our consumer(our app) and the newly created (and verified) token

```python
client = oauth2.Client(consumer, token)
```

### Ask Twitter for an access token, and Twitter knows it should give us it because we've verified the request token

```python
response, content = client.request(constants.ACCESS_TOKEN_URL, 'POST')
access_token = dict(urlparse.parse_qsl(content.decode('utf-8')))
```

### Create an 'authorized_token' Token object and use that to perform Twitter API calls on behalf of the user

```python
authorized_token = oauth2.Token(access_token['oauth_token'], access_token['oauth_token_secret'])
authorized_client = oauth2.Client(consumer, authorized_token)
```

### Make Twitter API calls

```python
response, content = authorized_client.request('https://api.twitter.com/1.1/search/tweets.json?q=computers+filter:images', 'GET')
if response.status != 200:
    print("An error occurred when searching!")

# print(content.decode('utf-8'))
tweets = json.loads(content.decode('utf-8'))

for tweet in tweets['statuses']:
    print(tweet['text'])

# print(content.decode('utf-8'))
```

## Detailed app summary

1. Create a **consumer**, which uses CONSUMER_KEY and CONSUMER_SECRET to identify our app uniquely
1. Create a **client** with our **consumer**(our app) and use the **client** to perform a request for the **request token**
1. Get the **request token** parsing the query string returned
1. Ask the user to authorize our app and give us the PIN code
1. Create **Token object** that contains the request token, and the **verifier**
1. Create a **client** with our **consumer**(our app) and the newly created (and verified) **token**
1. Ask Twitter for an **access token**, and Twitter knows it should give us it because we've verified the **request token**
1. Create an **'authorized_token' Token object** and use that to perform Twitter API calls on behalf of the user
1. Make Twitter API calls

## Basic console app v1 (full code)

```python
import constants
import oauth2
import urllib.parse as urlparse
import json

# Create a consumer, which uses CONSUMER_KEY and CONSUMER_SECRET to identify our app uniquely
consumer = oauth2.Consumer(constants.CONSUMER_KEY, constants.CONSUMER_SECRET)

# Create a client with our consumer(our app) and use the client to perform a request for the request token
client = oauth2.Client(consumer)
response, content = client.request(constants.REQUEST_TOKEN_URL, 'POST')
if response.status != 200:
    print("An error occurred getting the request token from Twitter!")

# Get the request token parsing the query string returned
request_token = dict(urlparse.parse_qsl(content.decode('utf-8')))

# Ask the user to authorize our app and give us the PIN code
print("Go to the following site in your browser:")
print("{}?oauth_token={}".format(constants.AUTHORIZATION_URL, request_token['oauth_token']))
oauth_verifier = input("What is the PIN? ")

# Create Token object that contains the request token, and the verifier
token = oauth2.Token(request_token['oauth_token'], request_token['oauth_token_secret'])
token.set_verifier(oauth_verifier)

# Create a client with our consumer(our app) and the newly created (and verified) token
client = oauth2.Client(consumer, token)

# Ask Twitter for an access token, and Twitter knows it should give us it because we've verified the request token
response, content = client.request(constants.ACCESS_TOKEN_URL, 'POST')
access_token = dict(urlparse.parse_qsl(content.decode('utf-8')))

print(access_token)

# Create an 'authorized_token' Token object and use that to perform Twitter API calls on behalf of the user
authorized_token = oauth2.Token(access_token['oauth_token'], access_token['oauth_token_secret'])
authorized_client = oauth2.Client(consumer, authorized_token)

# Make Twitter API calls
response, content = authorized_client.request('https://api.twitter.com/1.1/search/tweets.json?q=computers+filter:images', 'GET')

if response.status != 200:
    print("An error occurred when searching!")

# print(content.decode('utf-8'))
tweets = json.loads(content.decode('utf-8'))

for tweet in tweets['statuses']:
    print(tweet['text'])
```

# Summary

1. Request token
1. Sign in with Twitter
1. Authorization code (redirect or PIN code)
1. Access token

# Resources

[Twitter API documentation](https://developer.twitter.com/en/docs/api-reference-index)
[Standard search](https://developer.twitter.com/en/docs/tweets/search/api-reference/get-search-tweets.html)