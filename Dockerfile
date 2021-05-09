FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# all will go to /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# not any run command because standart command of nginx container will run it

