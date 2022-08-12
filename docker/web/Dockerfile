FROM ruby:3.1.2

ENV LANG C.UTF-8
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq \
    && apt-get install -y curl apt-transport-https wget \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn \
    && apt-get install -y nodejs default-mysql-client \
    && apt-get install -y --no-install-recommends \
    vim-tiny vim cron \
    graphviz \
    fonts-ipa* \
    fonts-ipafont-gothic\
    libmagic-dev \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app

ENV GEM_HOME /app/vendor/bundle
ENV BUNDLE_PATH /app/vendor/bundle
ENV BUNDLE_BIN /app/vendor/bundle/bin
ENV PATH $BUNDLE_BIN:$BUNDLE_PATH/gems/bin:$PATH

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

COPY ./docker-entrypoint-worker.sh /
RUN chmod +x /docker-entrypoint-worker.sh

COPY ./wait-for-it.sh /
RUN chmod +x wait-for-it.sh

WORKDIR /app
