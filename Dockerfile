FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Set the working directory
WORKDIR /app

# Copy project files
COPY . .

# Create a virtual environment
RUN python3 -m venv venv

# Activate virtual environment and install dependencies
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Run the FastAPI app
CMD ["/app/venv/bin/python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
