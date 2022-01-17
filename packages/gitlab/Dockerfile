# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app

COPY . .

WORKDIR /app/gitlab
COPY pubspec.* ./
RUN dart pub get

RUN dart pub get --offline
RUN dart compile exe bin/main.dart -o bin/main

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/gitlab/bin/main /app/bin/

ENTRYPOINT [ "/app/bin/main" ]