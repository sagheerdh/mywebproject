# Use a slim Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies (system + Python)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency file first (for better caching)
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY app.py .

# Set environment variable for production (optional)
ENV PYTHONUNBUFFERED=1

# Expose the port your app will run on (80 for ECS)
EXPOSE 80

# Run the app
CMD ["python", "app.py"]
