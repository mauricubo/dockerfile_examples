#!/usr/bin/env bash
# script from https://smirnov-am.github.io/running-flask-in-production-with-docker/
service nginx start
uwsgi --ini uwsgi.ini
