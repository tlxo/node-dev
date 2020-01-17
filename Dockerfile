FROM node:10

ENV NODE_ENV=development
WORKDIR /usr/local/tlxo
COPY package.json /usr/local/tlxo/package.json

RUN npm install

COPY gulpfile.js /usr/local/tlxo/gulpfile.js
COPY .babelrc /usr/local/tlxo/.babelrc
COPY src /usr/local/tlxo/src
RUN npm run compile

EXPOSE 8877

CMD ["babel-node", "tlxo/server"]
