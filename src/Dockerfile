FROM ruby:2.7.0

RUN bundle config --global frozen 1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev ghostscript

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN node -v
RUN npm -v

RUN bundle install
RUN npm install -g yarn

RUN yarn install --check-files

COPY . ./

RUN rm -f config/master.key
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY $RAILS_MASTER_KEY
ENV RAILS_ENV=production
RUN echo $RAILS_MASTER_KEY
RUN bundle exec rake assets:clean
RUN bundle exec rake assets:precompile


EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]