FROM --platform=linux/amd64 python:3.8-alpine
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install requests datetime flask
CMD ["python", "app.py"]
