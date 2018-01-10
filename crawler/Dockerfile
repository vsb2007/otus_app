FROM python:3.6.0-alpine
ADD ./search_engine_crawler /app
WORKDIR /app
RUN pip install -r requirements.txt

ENV MONGO mongo
ENV MONGO_PORT 27017
ENV RMQ_HOST rabbit
#ENV RMQ_QUEUE
#ENV URL https://vitkhab.github.io/search_engine_test_site/
ENV EXCLUDE_URLS *github.com
ENV CHECK_INTERVAL 36000

ENTRYPOINT ["python", "-u","crawler/crawler.py","https://vitkhab.github.io/search_engine_test_site/"]
