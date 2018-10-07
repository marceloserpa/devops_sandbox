FROM node:8

WORKDIR /usr/src/app

COPY package.json .

RUN npm install

COPY . /usr/src/app

EXPOSE 9010:9010

CMD [ "node", "server.js" ]
