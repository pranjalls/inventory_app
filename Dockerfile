# Use official Node.js image (LTS version recommended)
FROM node:18

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the app
CMD [ "npm", "start" ]
