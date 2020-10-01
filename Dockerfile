FROM node:12.8-alpine AS builder
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

# Deploy to Nginx Server
FROM nginx:stable-alpine
COPY --from=builder /app/dist/ /usr/share/nginx/html/
