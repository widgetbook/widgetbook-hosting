FROM dart:stable AS build

WORKDIR /app

COPY . .

WORKDIR /app/gitlab
COPY pubspec.* ./
RUN dart pub get

RUN dart pub get --offline
RUN dart compile exe bin/main.dart -o bin/main

FROM bash:4.4
COPY --from=build /runtime/ /
COPY --from=build /app/gitlab/bin/main /app/bin/