FROM node:20

WORKDIR /app

COPY package-*.json .

RUN npm ci

COPY . /app

CMD ["npm", "start"]