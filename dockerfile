FROM ubuntu
USER root
RUN mkdir -p django_project
RUN chmod 777 django_project 
ADD . /django_project
RUN apt-get update -qq
RUN apt-get install python3 -qq
RUN apt-get install python3-pip -qq
WORKDIR /django_project
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
ENTRYPOINT python3 manage.py runserver 0.0.0.0:8000
