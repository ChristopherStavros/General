# What is a REST API

- **REST** stands for "Representational State Transfer"
- A way of thinking about how a web server behaves in general
- Doesn't respond with just data
- Responds with resources

## Resources

- Similar of object oriented programming
- Think of the server as having resources, and each is able to interact with the pertinent request

## REST principles

- Client server interface
- Stateless
- Cacheable
- Uniform interface

### Stateless

- One request cannot depend on any other requests
- The server only knows about the current request, and not any previous requests
- For example:
    - **POST /item/chair** creates an item
    - The server does not know the item now exists
    - **GET /item/chair** then goes to the database and checks to see if the item is there
    - To get an item you do not need to have created an item before - the item could be in the database from previously
- Another example:
    - A user logs on to a web application
    - The web server does not know the user is logged in (since it does not remember any state)
    - What do we do?
    - The web application must send enough data to identify the user in every request, or else the server won't associate the request with the user

### Cacheable

- Upon reload, the contents will be exactly the same
- Clients can cache content locally

### Uniform interface

- If multiple servers are used, the interface is identical and therefore the results are the same no matter what server a client contacts

# HTTP Verbs

Verb | Meaning | Example
--- | --- | ---
GET | Retrieve Something | GET /item/1
POST | Receive data, and use it | POST /item
PUT | Make sure something is there | POST /item
DELETE | Remove something | DELETE /item/1

# Resources

[Twiiter API reference](https://developer.twitter.com/en/docs/api-reference-index.html)