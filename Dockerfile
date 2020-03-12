FROM node:latest

# Environment

WORKDIR /home/app
#ENV NODE_ENV=production

# Dependencies

COPY package.json /home/app/
COPY yarn.lock /home/app/
COPY lerna.json /home/app/

COPY packages/ExpoApp/package.json /home/app/packages/ExpoApp/
#COPY packages/ExpoApp/yarn.lock /home/app/packages/ExpoApp/

COPY packages/web-app/package.json /home/app/packages/web-app/
#COPY packages/web-app/package-lock.json /home/app/packages/web-app/

CMD ["yarn", "install"]

# Build

COPY . /home/app/
#RUN cd packages/alice && npm run build