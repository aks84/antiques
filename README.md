# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## generate item scaffold
``rails generate scaffold Item name:string images:attachments description:text starting_price:decimal current_bid:decimal end_time:datetime``

## generate user scaffold
``rails generate scaffold User name:string email:string password:string``

## generate bid scaffold
``rails generate scaffold Bid amount:decimal item:references user:references``