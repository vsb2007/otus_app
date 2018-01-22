FROM python:3.6.0-alpine
ADD ./search_engine_crawler /app
WORKDIR /app
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "-u","crawler/crawler.py"]
