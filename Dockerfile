# Build Phase
FROM node:lts-alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "build" ]

# Run Phase
FROM nginx:stable-alpine-perl
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html