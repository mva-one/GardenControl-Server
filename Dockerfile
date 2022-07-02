FROM node:16

# app directory inside container
WORKDIR /app

# install dependencies
COPY package*.json ./
RUN npm install

# copy needed app files to the container
COPY . .

# open port 3001
EXPOSE 3001

# start app
CMD [ "node", "start.js" ]