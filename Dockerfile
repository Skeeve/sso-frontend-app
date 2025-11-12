FROM node:trixie

WORKDIR /app

COPY . /app
RUN npm i
