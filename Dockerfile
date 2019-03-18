FROM python:3.6.7-alpine
ENV PYTHONUNBUFFERED 1

RUN apk update && \
    apk add --virtual build-deps gcc python3-dev musl-dev && \
    apk add mariadb-dev && \
    apk add mariadb-client && \
    apk add mysql && \
    apk add mysql-client

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt
ADD ./ /code/
# CMD ["python", "mysite/manage.py", "runserver", "0.0.0.0:8001"]
