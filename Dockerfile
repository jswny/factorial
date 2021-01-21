FROM elixir:1.11.2-alpine AS builder

ENV MIX_ENV="prod"

WORKDIR /usr/src/app

COPY . .

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile
RUN mix release

FROM alpine:3.12 AS runner

ENV NCURSES_DEV_VERSION="6.2_p20200523-r0"

RUN apk update \
  && apk add --no-cache ncurses-dev="${NCURSES_DEV_VERSION}"

WORKDIR /factorial

COPY --from=builder /usr/src/app/_build/prod/rel/factorial .

ENTRYPOINT [ "bin/factorial" ]
CMD [ "start" ]
