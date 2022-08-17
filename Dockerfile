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
  openjdk17-jre-headless

COPY --from=deps /usr/src/emulators/node_modules ./node_modules

#RUN npm i -g firebase-tools

COPY firebase.json .
COPY .firebaserc .
COPY configs configs
COPY public public

EXPOSE 4000
EXPOSE 5000
# EXPOSE 5001
EXPOSE 8080
EXPOSE 8085
EXPOSE 9000
# EXPOSE 9005
EXPOSE 9099
EXPOSE 9199

ENTRYPOINT ["./node_modules/.bin/firebase"]
CMD ["emulators:start"]
