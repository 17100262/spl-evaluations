# Code Refactoring

This tasks requires you to refactor the existing code such that it follows certain design patterns and also does not change the functionality. Code refactoring is the process of restructuring existing computer code—changing the factoring—without changing its external behavior.


## Instructions for Setup

1. Clone the app
2. Run `bundle install` and run migrations to generate schema
3. Run `bundle exec figaro install` to generate `application.yml` configuration file.
4. Setup your own stripe account and add the secret key and publishable key to `config/application.yml`

```
# config/application.yml

development:
  stripe_publishable_key: "YOUR OWN STRIPE KEY"
  stripe_secret_key: "YOUR OWN STRIPE SECRET"
``` 
5. Start the server using `rails s` command

## App Description

The app is small e-commerce store which has prducts and orders. The listed products then can be purchased using credit card for which Stripe is used.




## Instructions for Task

THE MOST IMPORTANT INSTRUCTION: READ IT CAREFULLY!

You are required to refactor the code in `controllers/orders_controller#create_session` using service object pattern. Also you are required to implement the stripe using Adapter Pattern.

### What are service objects?

Service objects are plain old Ruby objects (PORO’s) that do one thing.
They encapsulate a set of business logic, moving it out of models and controllers and into a more focused setting. For more detail checkout this blog [Service objects in Rails
](https://medium.com/@scottdomes/service-objects-in-rails-75ca74214b77)

### What is Adapter Pattern?

An adapter can provide an interface for different classes to work together. In the Object Adapter Pattern, the adapter contains an instance of the class it wraps. In this situation, the adapter makes calls to the instance of the wrapped object.

In Rails, the adapter pattern is often implemented to wrap API clients, providing a reusable interface for communicating with external APIs. For mote details check [Rails Refactoring Part I: The Adapter Pattern
](https://www.thegreatcodeadventure.com/rails-refactoring-part-i-the-adapter-pattern/)





## Assessment

I will evaluate your solution based on:

1. How well it has been refactored?
2. External behaviour is same or not.
3. Any additional improvement
4. Did you take the systematice approach for solving problem? 

## Submission

When you are done with the tasks, generate a Pull Request from this branch. Please make elaborative and self explanatory commits along the way to show the process you followed. Since i will be closely looking at the process and approach so SINGLE COMMITS are DISCOURAGED. It would result in negative points.


## ANOTHER IMPORTANT THING
Since the instructions are very clear and descriptive so any other Questions will not be accomodated except those related to app setup.

# GOOD LUCK!

<!-- Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
