FROM dart:stable AS build

WORKDIR /app

COPY . .

WORKDIR /app/bitbucket

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/main

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bitbucket/bin/main /app/bin/

SHELL ["/bin/bash", "-c"]

# ENTRYPOINT [ "/app/bin/main" ]