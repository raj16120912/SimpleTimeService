#Lets use a python alpine image as a base image
FROM python:3.14.0a7-alpine

#Change directory inside the base image
WORKDIR /app

#Now Copy the required_modules.txt file into the image
COPY required_modules.txt .

#Install flask module
RUN pip install --no-cache-dir -r required_modules.txt

#Copy the simpletimeservice.py inside the image
COPY simpletimeservice.py .

# Expose port Flask will run on
EXPOSE 5000

# Run the Flask app
CMD ["python", "simpletimeservice.py"]



