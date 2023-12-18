FROM node:20

WORKDIR /app

COPY *.json /app/

RUN npm ci

COPY . /app

EXPOSE 3000

CMD ["npm", "start"]