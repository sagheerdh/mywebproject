# Base image
FROM python:3.9-slim

# Working directory inside container
WORKDIR /app

# Copy files into container
COPY requirements.txt
RUN pip install -r requirements.txt

COPY app.py

# Expose port
EXPOSE 80

# Run the app
CMD ["python", "app.py"]
