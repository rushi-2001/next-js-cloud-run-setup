# Use Node.js as the base image
FROM node:18.15.0-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock to the container
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the app's source code to the container
COPY . .

# Build the Next app
RUN yarn build

# Serve the production build
CMD ["yarn", "start"]
