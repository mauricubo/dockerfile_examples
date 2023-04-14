FROM python:3.9.2-slim as flask

RUN pip install --upgrade pip

COPY --chown=www-data:www-data . /usr/app/my_app
RUN chown -R www-data:www-data /usr/app/my_app
WORKDIR /usr/app/my_app

RUN apt-get clean \
    && apt-get -y update
RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential \
    && apt-get -y install libpq-dev

RUN pip install -r requirements.txt
RUN mv nginx/nginx.conf /etc/nginx
RUN chmod +x nginx/startup.sh

RUN export DOCKER_DEFAULT_PLATFORM=linux/amd64

CMD ["./nginx/startup.sh"]
