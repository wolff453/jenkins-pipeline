FROM node:20

WORKDIR /app

COPY *.json /app/

RUN npm ci

COPY . /app

CMD ["npm", "start"]