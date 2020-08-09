FROM ruby

ENV LANG C.UTF-8

RUN apt update \
  && apt upgrade -y \
  && apt install -y nodejs

RUN gem install bundler:1.17.3
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

CMD ["middleman", "server"]
