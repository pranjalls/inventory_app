# Use Node.js official image
FROM node:18

# Set app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Expose port
EXPOSE 3000

# Run app
CMD [ "npm", "start" ]
