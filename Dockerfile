# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Set environment variables
ENV OPEN_AI_PROXY_TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6IjIzZjEwMDExNTZAZHMuc3R1ZHkuaWl0bS5hYy5pbiJ9.AgnwJIG1STSqRR_wuAIDdNX-RKY7w7n2kshPF8s2owo"
ENV OPEN_AI_PROXY_URL="https://aiproxy.sanand.workers.dev/openai/v1/chat/completions"
ENV OPEN_AI_EMBEDDING_URL="https://aiproxy.sanand.workers.dev/openai/v1/embeddings"
# Expose the port the app runs on
EXPOSE 8000

# Run the FastAPI app using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]