FROM python:3.7.3-stretch

# Create a working directory
WORKDIR /ml-microservice-api

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Copy source code to working directory
COPY . app.py /ml-microservice-api/
COPY . model_data/*.joblib /ml-microservice-api/

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "app.py"]
