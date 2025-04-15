**Tiny App Development: 'SimpleTimeService'**

*Overview*
1. Created a simple web application using Python Flask module to display timestamp and the visitors IP Address as per requirement.
2. Here we have three files
    - *simpletimeservice.py:* Contains python code to run the web application on flask.
    - *required_modules.txt:* Contains python modules that needs to be install in the Docker image i.e. Flask.
    - *Dockerfile:* To build the image.

*Procedure*
1. Clone the repo from Github.
```
git clone https://github.com/raj16120912/SimpleTimeService.git
```
2. Build docker image and push in container registry
```
cd SimpleTimeService/app/
docker build -t <username>/simpletimeservice:<tag> .
docker push <username>/simpletimeservice:<tag>
```
OR
Can you use image I built and pushed in DockerHub 
```
docker pull raj16120912/simpletimeservice:v4
```
The app runs on port 5000/tcp which is default port for flask.

3. Run the built docker image in docker container.
```
docker run -d -p 5000:5000 raj16120912/simpletimeservice:v4
```
Confirm the response `http://localhost:5000`