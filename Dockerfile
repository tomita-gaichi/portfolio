FROM ruby:3.0.1
RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn
RUN mkdir /portfolio
WORKDIR /portfolio
COPY Gemfile /portfolio/Gemfile
COPY Gemfile.lock /portfolio/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /portfolio
