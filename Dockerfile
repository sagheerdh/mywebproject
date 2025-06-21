# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Run the app (for test)
CMD ["python", "app.py"]
