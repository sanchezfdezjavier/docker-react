# Creation of TEMPORARY container to dump the /build directory
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Final image that will be running the production verison
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html