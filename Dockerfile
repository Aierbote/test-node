FROM node:20.15.0

# ### NOTE : to fix `ERR_OSL_EVP_UNSUPPORTED`
# ENV NODE_OPTIONS=--openssl-legacy-provider
# RUN apt-get update && apt-get install -y openssl ca-certificates

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY package*.json /usr/src/app

RUN npm install

COPY .  /usr/src/app

EXPOSE 4000
CMD [ "npm", "start" ]