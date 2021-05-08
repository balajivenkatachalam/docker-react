#BUILD PHASE
FROM node:alpine
WORKDIR '/app'
COPY package.json .
#install only required by npm run build
RUN npm install
COPY . .
RUN npm run build
#/app/build will have all the outputs of above phase

#RUN PHASE
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html