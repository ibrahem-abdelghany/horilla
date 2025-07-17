#!/bin/bash

echo "Waiting for database to be ready..."
pip install --upgrade pip
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput
python3 manage.py createhorillauser --first_name admin --last_name admin --username admin --password admin --email admin@example.com --phone 1234567890
gunicorn --bind 10.0.0.1:8000 horilla.wsgi:application
