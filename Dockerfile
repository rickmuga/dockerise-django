FROM python:3.7.2-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD ./ /code/
CMD ["python", "mysite/manage.py", "runserver", "0.0.0.0:8001"]
