# Use a slim Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt ./

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py ./

# Set environment variable for logs
ENV PYTHONUNBUFFERED=1

# Expose the port (ECS expects this)
EXPOSE 80

# Run the app
CMD ["python", "app.py"]
