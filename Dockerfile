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
RUN ls -R /app
# Run the bot
# Debug: List all files in the container to see where main.py is
RUN find . -maxdepth 3 -not -path '*/.*'

# Run the bot
CMD ["python", "backend/main.py"]
