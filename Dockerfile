FROM ruby:2.7

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq \
    && apt-get install -y nodejs yarn

WORKDIR /rails_docker
COPY Gemfile /rails_docker/Gemfile
RUN bundle config --local set path 'vendor/bundle' \
    && bundle install

#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]