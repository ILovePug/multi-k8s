FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

#now builder phrase will pull everything (production code) in to the builder folder

FROM nginx
#OPEN port 3000 so it can listen to the main nginx routing server
EXPOSE 3000 
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#copy the final build to nginx public facing folder
COPY --from=builder /app/build /usr/share/nginx/html