FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#starting a 2nd phase : from statement is a phase that blocks data
FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html
