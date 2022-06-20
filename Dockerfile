# build env
#FROM node:13.12.0-alpine as build
#WORKDIR /app
#COPY package*.json ./
#RUN npm ci
#COPY . ./
#RUN npm run build

# #############################   Stage 0, Build the app   #####################
# pull official base image
FROM node:13.12.0-alpine as build-stage
# set working directory
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install app dependencies
COPY package*.json ./
#RUN npm install
RUN npm install

# add app
COPY . ./

#build for production
RUN npm run-script build

# #### Stage 1, push the compressed  built app into nginx ####
FROM nginx:1.17

COPY --from=build-stage /app/build/ /usr/share/nginx/html

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