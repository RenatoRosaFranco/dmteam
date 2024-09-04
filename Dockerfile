FROM ruby:2.7.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN gem update --system 3.3.22
RUN gem install bundler:2.2.11

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]