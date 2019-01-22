FROM ruby:2.5.3

ENV BUNDLER_VERSION=1.16.6

RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR /root/app

ADD Gemfile* ./

RUN bundle install

ADD . ./

ENV SINATRA_PORT=6666

CMD bundle exec ruby app.rb -p $SINATRA_PORT
