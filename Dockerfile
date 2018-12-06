        FROM node:8.0-alpine AS builder

        WORKDIR /app

        COPY package.json /app

        # Creating tar of productions dependencies
        RUN npm install --production && cp -rp ./node_modules /tmp/node_modules

        # Installing all dependencies
        RUN npm install

        # Copying application code
        COPY . /app

        # Running tests
        RUN npm test

        EXPOSE 8080

        CMD [ "npm", "start" ]