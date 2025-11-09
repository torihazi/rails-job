FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  vim \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]