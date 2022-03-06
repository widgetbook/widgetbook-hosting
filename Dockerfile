FROM dart:stable AS build

WORKDIR /app

COPY /packages/ .

WORKDIR /app/github
RUN dart pub get

RUN dart compile exe bin/main.dart -o bin/widgetbook-hosting

FROM bash:4.4
COPY --from=build /runtime/ /
COPY --from=build /app/github/bin/widgetbook-hosting /

SHELL [ "bash" ]

ENTRYPOINT [ "/widgetbook-hosting" ]