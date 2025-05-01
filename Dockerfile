# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port Hugging Face expects
EXPOSE 7860

# Run Django using gunicorn
CMD ["gunicorn", "TrackStock.wsgi:application", "--bind", "0.0.0.0:7860"]
