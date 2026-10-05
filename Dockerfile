# Build the React app, then serve the static build with nginx.
# Self-hosted at https://crown.mycodedojo.com (homelab ~/portfolio-projects).
ARG NODE=16
FROM node:${NODE}-alpine AS build
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY package*.json ./
RUN npm ci --legacy-peer-deps || npm install --legacy-peer-deps
COPY . .
ARG REACT_APP_FIREBASE_APIKEY
ARG REACT_APP_FIREBASE_AUTHDOMAIN
ARG REACT_APP_FIREBASE_PROJECTID
ARG REACT_APP_FIREBASE_STORAGEBUCKET
ARG REACT_APP_FIREBASE_MESSAGESENDERID
ARG REACT_APP_FIREBASE_APPID
ARG REACT_APP_STRIPE_PUBLISHABLE_KEY
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
RUN printf 'server {\n  listen 80;\n  root /usr/share/nginx/html;\n  location / { try_files $uri $uri/ /index.html; }\n}\n' > /etc/nginx/conf.d/default.conf
