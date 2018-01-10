FROM python:3.6.0-alpine
ADD ./search_engine_ui /app
WORKDIR /app
RUN pip install -r requirements.txt

ENV MONGO mongo
ENV MONGO_PORT 27017
ENV FLASK_APP ui.py
WORKDIR /app/ui
CMD ["gunicorn", "ui:app", "-b", ":8000"]
