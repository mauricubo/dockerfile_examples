FROM node:current-alpine3.17 AS build
WORKDIR /usr/app
COPY . /usr/app/
ARG REACT_APP_BASE_API_URL
ENV REACT_APP_BASE_API_URL $REACT_APP_BASE_API_URL
RUN npm ci
RUN npm run build

FROM nginx:alpine-slim
EXPOSE 80
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /usr/app/build /usr/share/nginx/html
