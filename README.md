# Shlomi Israel - Submition for Marely Spoon

This is a RoR application which uses ContentfulModel in order to model and list
Recipes and their information.

## Environment

I used Ruby 2.7.0 and RoR 6.0.3.2.

I installed it using RVM 1.29.10

## In order to run tests:

```bash
cd src/
# In production the following will be stored safely
echo 3ce63381373024fc46c768da637f5797 > config/master.key
bundle install
yarn install --check-files
rake test
```

## In order to run in dev mode:

```bash
cd src/
echo 3ce63381373024fc46c768da637f5797 > config/master.key
bundle install
yarn install --check-files
rails s
```

then go to http://localhost:3000

## In order to run using docker-compose (production mode):

make sure you are in the root directory.

```bash
docker-compose up
```

then go to http://localhost:3000

## Notes about production

I have put the `RAILS_MASTER_KEY` in the docker-compose for the purposes of making
the assignment easy to run. In production setup, this file
should be managed separately (with ansible or puppet) and stored securely.

## Application's Architecture

There are 3 models in the app:

- `Chef` - has many recipes
- `Tag` - has many recipes
- `Recipe` - has one chef and many tags

There is a single controller `RecipeController` which is responsible for handling requests about recipes. And processing the data for the views.

It supports two actions:

- `list` - list recipes, will render the list view.
- `details` - will show the details of a single recipe using the details view. If an unknown recipe id will be requested, an 404 page will be displayed.
  The recipe description is interpolated as markdown.
