# Dockerfile-flask
# We simply inherit the Python 3 image. This image does
# not particularly care what OS runs underneath
FROM python:3.8.6

# Create the directory and instruct Docker to operate
# from there from now on
RUN mkdir /app
WORKDIR /app

# Copy the requirements file in order to install
# Python dependencies
COPY ./flaskapp/requirements.txt .
RUN pip install -r requirements.txt

#Upgrading pip
RUN pip install --upgrade pip --user

# We copy the rest of the codebase into the image
COPY ./flaskapp .
COPY ./app.py .

EXPOSE 5000
ENV FLASK_APP=app.py
ENV DATABASE=/data/master.db
ENV MODEL=/model/RandomForest.pkl

CMD ["flask", "run", "--host", "0.0.0.0"]

