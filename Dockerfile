FROM python:3.8

## SYSTEM #####################################
## Install system related patches
RUN apt-get update -y && apt-get install ca-certificates -y && apt-get autoremove -y
RUN pip install --upgrade pip

## PYTHON #####################################
# Install Python Packages
COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /flask_profiler
WORKDIR /flask_profiler

# SET ENV VARS
RUN export PYTHONPATH=/flask_profiler

EXPOSE 5000

# NEVER-ENDING SHELL ACCESS
# CMD ["sleep", "10000000000"]

## RUN FLASK
CMD ["flask", "run", "--host=0.0.0.0"]