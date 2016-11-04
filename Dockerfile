FROM ruby:2.3.1

WORKDIR /src

ADD . /src
RUN gem install bundler --no-ri --no-doc && bundle install

VOLUME /src

