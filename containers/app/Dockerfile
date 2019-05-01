FROM ruby:2.5.1

ENV LANG C.UTF-8
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV ENTRYKIT_VERSION 0.4.0
RUN wget -q https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    mv entrykit /bin/entrykit && \
    chmod +x /bin/entrykit && \
    entrykit --symlink

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential zip vim wget apt-transport-https mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## ENV ##
ENV SRC_DIR /usr/local/src

# Root of rails project
ENV APP_HOME /var/www

ENV BUNDLE_TIMEOUT 30

# node
RUN apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs

# Root directory
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/log
WORKDIR $APP_HOME

# Port
EXPOSE 3000

ENTRYPOINT [ \
    "prehook", "ruby -v", "--", \
    "prehook", "rm -f tmp/pids/server.pid", \
    "prehook", "bundle install -j4", "--"]
