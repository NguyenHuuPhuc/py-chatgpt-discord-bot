# Use an official Python runtime as a parent image
FROM python:3.11.0-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Create a disk for the SQLite database file
VOLUME /data

# Run main.py when the container launches
CMD ["python", "./main.py"]
