FROM ruby:onbuild
MAINTAINER mhutter "https://github.com/mhutter"

ENV PORT=4567 \
    LANG=C.UTF-8 \
    RACK_ENV=production

# - install Foreman
# - install node.js
# - run script/build if present
RUN gem install foreman \
 && curl -sSL -o node.tgz "https://nodejs.org/dist/v5.1.0/node-v5.1.0-linux-x64.tar.gz" \
 && mkdir -p /usr/src/node \
 && tar -xzf node.tgz -C /usr/src/node --strip-components=1 \
 && rm node.tgz \
 && ln -s /usr/src/node/bin/* /usr/local/bin/ \
 && (test -e script/build && script/build)

EXPOSE ${PORT}

CMD ["foreman","start","-d","/usr/src/app"]
