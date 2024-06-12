# sample dockerfile for testing docker builds
FROM nginx:1.25.3-alpine as base

RUN apk add --no-cache curl

RUN apk upgrade --available

WORKDIR /test

COPY . .

#########################
FROM base as test

#layer test tools and assets on top as optional test stage
RUN apk add --no-cache apache2-utils


#########################
FROM base as final

# this layer gets built by default unless you set target to test
