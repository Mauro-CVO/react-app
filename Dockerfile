#FROM node:12.18-alpine
#ENV NODE_ENV=production
#ENV PORT=80

#WORKDIR /app
#COPY . .
#RUN npm install
#EXPOSE 80
#CMD ["npm", "start"]

FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html