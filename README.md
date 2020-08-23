# Shlomi Israel - Submition for Marely Spoon

This is a RoR application which uses ContentfulModel in order to model and list
Recipes and their information.

## Environment

I used Ruby 2.7.0 and RoR 6.0.3.2.

I installed it using RVM 1.29.10

## In order to run tests:

```
cd src/
bundle install
rake db:migrate #needed to create schema.rb
rake test
```

## Setup credentials

In order for the app to work (in dev and prod) edit Rails credentials using:

```
EDITOR=vim rails credentials:edit
```

and add the following keys:

```
contentful_space_id:
contentful_env_id:
contentful_access_token:
```

## In order to run in dev mode:

```
cd src/
bundle install
rails s
```

## In order to run using docker-compose (production mode):

make sure you are in the root directory.

```
docker-compose up
```
