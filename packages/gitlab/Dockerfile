FROM dart:stable AS build

WORKDIR /app

COPY . .

WORKDIR /app/gitlab
RUN dart pub get

RUN dart compile exe bin/main.dart -o bin/widgetbook-hosting

FROM bash:4.4
COPY --from=build /runtime/ /
COPY --from=build /app/gitlab/bin/widgetbook-hosting /

SHELL [ "bash" ]