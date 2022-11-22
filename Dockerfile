FROM ruby:2.6.8

WORKDIR /root

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

WORKDIR /app

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

COPY ./docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
# Start the main process.
CMD ["bundle", "exec","puma","-C","config/puma.rb"]
