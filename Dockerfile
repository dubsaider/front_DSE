# Select base layer of docker image (пока не уверен точно насчет данного базового слоя)
FROM node:lts-alpine as build-stage
# Make workdir
WORKDIR /app
# Copy file with dependencies
COPY package.json .
# Run and install file from the previous point
RUN npm install
# Copy project to image
COPY . .
# Build project
RUN npm run build

# Add nginx
FROM nginx:stable-alpine as production-stage
# Copy files
COPY --from=build-stage /app/dist /usr/share/nginx/html
# Open a port
EXPOSE 80
# Start nginx
CMD ["nginx", "-g", "daemon off;"]