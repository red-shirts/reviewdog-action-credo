FROM elixir:1.9.4-alpine

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.9.13
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENV MIX_ARCHIVES /opt/archives

RUN mix do local.hex --force, \
           archive.install --force github rrrene/bunt, \
           archive.install --force github rrrene/credo

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
