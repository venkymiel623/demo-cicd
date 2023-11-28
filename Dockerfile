FROM python:3.8-slim
WORKDIR /app
COPY . /app
ENV NAME World
CMD ["python", "app.py"]
