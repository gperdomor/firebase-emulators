FROM node:18.7.0-alpine as deps
RUN apk --no-cache add libc6-compat
WORKDIR /usr/src/emulators
COPY package*.json ./
RUN npm install --only=production

FROM node:18.7.0-alpine as production
LABEL maintainer="Gustavo Perdomo <gperdomor@gmail.com>"
WORKDIR /usr/src/emulators
RUN apk --no-cache add \
    bash \
    curl \
    libc6-compat \
    openjdk11-jre-headless

# COPY --from=deps /usr/src/emulators/node_modules ./node_modules

RUN npm i -g firebase-tools

# RUN firebase setup:emulators
# RUN firebase setup:emulators:ui

COPY firebase.json .
COPY .firebaserc .
COPY configs configs
COPY public public

# COPY firestore.rules .

# ARG FIRESTORE_PORT=8080
# ENV FIRESTORE_PORT=${FIRESTORE_PORT}

# ARG AUTH_PORT=9099
# ENV AUTH_PORT=${AUTH_PORT}

# EXPOSE ${FIRESTORE_PORT} ${AUTH_PORT}

ENTRYPOINT ["firebase"]
CMD ["emulators:start"]