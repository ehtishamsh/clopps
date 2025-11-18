FROM node:20 AS developer
WORKDIR /app

RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    build-essential curl git python-is-python3 \
 && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .
EXPOSE 3000

CMD ["npm", "run", "dev"]

