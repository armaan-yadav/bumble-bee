FROM python:3.13-slim

WORKDIR /app

COPY . .

# Install system dependencies for psycopg
RUN apt-get update && apt-get install -y libpq-dev gcc

RUN pip install --upgrade pip \
    && pip install --no-cache-dir fastapi uvicorn sqlalchemy psycopg

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
