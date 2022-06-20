# build env
#FROM node:13.12.0-alpine as build
#WORKDIR /app
#COPY package*.json ./
#RUN npm ci
#COPY . ./
#RUN npm run build

FROM node:alpine
WORKDIR /react-app
ENV PATH="./node_modules/.bin:$PATH"
COPY ./react-app/package.json /react-app/
RUN npm install
COPY ./react-app/ /reacvt-app/
RUN npm run build

# production env
#FROM nginx:stable-alpine
#COPY --from=build /app/build /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
##
#FROM node:current-alpine
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#CMD npm start