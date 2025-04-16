# Pull the official Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies (useful for PostgreSQL and other Python packages)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy only requirements.txt (so that Docker can cache pip installs)
COPY ./requirements.txt /usr/src/app/

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the project files into the container
COPY . /usr/src/app

# Expose port 8000 for Django
EXPOSE 8000

# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]