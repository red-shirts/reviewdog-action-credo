ARG ELIXIR_VERSION=1.15.6
ARG OTP_VERSION=26.1.2
ARG DEBIAN_VERSION=buster-20230612-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE}

RUN apt-get update -y && apt-get install -y git wget \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.16.0

ENV MIX_HOME /var/mix

RUN mix local.hex --force && \
    mix archive.install --force github rrrene/bunt && \
    mix archive.install --force github rrrene/credo

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
