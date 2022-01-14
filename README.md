# Neigh-bors

![neighbors-cover](https://user-images.githubusercontent.com/87627363/149588621-c88d3986-1c43-40a9-bc51-10461514ba60.jpg)

## Project Description
The Neigh-bors application is designed to connect farms with volunteer rescuers to evacuate horses during natural disaster events. The app includes both a backend repo (this repo) and a frontend repo (found here: [Neigh-bors Frontend Repo](https://github.com/chloell5/neigh-bors-fe). The backend of this app has been deployed to Heroku at [Neigh-bors](https://neigh-bors-be.herokuapp.com/api/v1/).

## Shipping Changes
If you would like to make changes to this project, please contact the owner of this repository via GitHub.

## Setup
This project was developed via Ruby 2.7.2, on Rails 5.2.6. It incorporates Circle CI.

To access the dev environment for this app please follow these steps:
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
  * `bundle`
  * `bundle exec figaro install`
  * `rails db:{drop,create,migrate,seed}`

You can access the test suite (includes use of Capybara, FactoryBot, Faker, RSpec, Shouldamatchers, and Pry) via `bundle exec rspec`.

## Contributors
This project was developed via Ruby on Rails by Philip Medlin, Chloe Price, Luis Arroyo, Lesley Sanders, and Didi Dodson at Turing School of Software and Design in 2022.
