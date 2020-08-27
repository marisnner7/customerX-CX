
![lastcommit](https://img.shields.io/github/last-commit/marisnner7/customerx-cx)
![size](https://img.shields.io/github/languages/code-size/marisnner7/customerx-cx)

## Description
Customer and contact list

## Live Demo


## Authors:
* [Marianne- Github](https://github.com/marisnner7)
* Gmail: mariannehaguiar@gmail.com


## Features

# Customer
* Sign up / login / logout / reset password
* Customer Page
* CRUD functions for Customer (C- create, R-read, U-update, D-delete)
* <b> has many contacts </b> 

## Contacts
* CRUD
* Contacts display with the name, cellphone and email
* <b> belongs to a Customer </b>



## Entity Relationship Diagram (ERD)
![alt text](app/assets/images/erd.jpeg)


## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com), <b>Ruby '2.6.6' </b>, <b>Rails'~> 6.0.3.2' </b> and for Datebase used <b> PostgreSql</b>. Included <b> rspec </b> testing From your command line:

```bash
# Clone this repository
$ git clone git@github.com:marisnner7/customerX-CX.git

# Go into the repository
$ cd customerX-CX

# Install dependencies
$ bundle install

#  Create and Migrate the database
$ rails db:drop
$ rails db:create
$ rails db:migrate
$ rails db:seed


# Testing with rspec
$ rspec

# Run the app
$ rails s
```


