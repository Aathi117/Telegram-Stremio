# Use the official Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy your requirements
COPY requirements.txt .

# Install dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

# Copy the rest of your files
COPY . .

# Run the bot
CMD ["python", "-m", "backend.main"]

