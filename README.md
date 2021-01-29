# Gifts API

##Configuration

The app has the following tools preinstalled and configured:
  - Rspec
  - Factorybot
  - Faker
  - Database Cleaner
  - Shoulda Matchers

#Getting Started

After cloning the repo:
### Install the gems

```
bundle install
```
### Setup the database

Run docker-compose

```
docker-compose -f docker-compose.dev.yml up -d
```

Create test database

```
psql -h 127.0.0.1 -U apptegy gifts_api_development -p 31027
* The database password is: apptegy

CREATE DATABASE gifts_api_test;
```
### Migrate the database

```
bundle exec rake db:migrate
```

### Start the server

You need to start docker-compose first

```
bundle exec rails s -p 3027
```

### Production Service

The proyect is running on heroku in the domain

```
https://apptegy.herokuapp.com/
```

You can use postman collection

```
https://www.getpostman.com/collections/4369c2bf68ee4e0e6cd9
```