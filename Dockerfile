FROM node:13.10.1
RUN ["yarn", "add", "expo-cli", "--global"]

# Environment

WORKDIR /home/app

# Dependencies

COPY package.json /home/app/
COPY lerna.json /home/app/

COPY packages/ExpoApp/package.json /home/app/packages/ExpoApp/

COPY packages/web-app/package.json /home/app/packages/web-app/


WORKDIR /home/app
RUN ["yarn", "install"]

# Build

COPY . /home/app/
#RUN cd packages/alice && npm run build