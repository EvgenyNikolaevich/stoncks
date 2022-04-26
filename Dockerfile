FROM ruby:3.0.4
WORKDIR /usr/src/app
RUN apt-get update -yqq
RUN git config --global user.name "Eugene Perov" && \
    git config --global user.email evgenynikolaevich3@gmail.com

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config - global frozen 1
# COPY Gemfile Gemfile.lock ./
# RUN bundle install

# COPY . .
# CMD ["/your-daemon-or-script.rb"]