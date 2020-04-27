[![CircleCI](https://circleci.com/gh/davidsimowitz/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/davidsimowitz/project-ml-microservice-kubernetes)

Operationalize a Machine Learning Microservice API
==================================================


Udacity - Cloud DevOps Engineer Nanodegree
------------------------------------------
Microservices at Scale using AWS & Kubernetes Project: Operationalize a Machine Learning Microservice API


### Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---


Requirements
============

+ [Git](https://git-scm.com/downloads) is installed.
  (Optional, if you wish to clone the project repository.)
+ [Python 3](https://www.python.org/downloads/) is installed. If you are running a version of Python earlier than 3.6, please download the latest version. This application uses [f-strings](https://www.python.org/dev/peps/pep-0498/) and requires at least version 3.6 to function correctly. It will raise a SyntaxError if it is run using an earlier version.
+ [VirtualBox](https://www.virtualbox.org/wiki/Downloads) is installed.
+ [Docker](https://www.docker.com/products/docker-desktop) is installed and configured.
+ The Dockerfile linter, [hadolint](https://github.com/hadolint/hadolint), is installed.
+ The Kubernetes command-line tool, [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) is installed and configured.
+ [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/), a tool that runs a single-node Kubernetes cluster in a virtual machine on your personal computer, is installed and configured.


Files
=====

* [.circleci/config.yml](https://circleci.com/docs/2.0/writing-yaml/)
  + CircleCI configuration is stored in a single YAML file located at ~/.circleci/config.yml, where ~ is the root of your project’s directory. YAML is a human-friendly data serialization standard for all programming languages. It is a strict superset of JSON, another data serialization language.

* [.dockerignore](https://docs.docker.com/engine/reference/builder/#dockerignore-file)
  + If this file exists in the roote directory of the context, the CLI modifies the context to exclude files and directories that match patterns in it. This helps to avoid unnecessarily sending large or sensitive files and directories to the daemon and potentially adding them to images using ADD or COPY.

* [app.py](https://flask.palletsprojects.com/en/1.1.x/)
  + A Flask application utlizing machine learning to predict housing prices in Boston. Flask is a microframework written in python.

* [Dockerfile](https://docs.docker.com/engine/reference/builder/)
  + A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Docker can build images automatically by reading the instructions from a Dockerfile.

* [make_prediction.sh](https://github.com/curl/curl)
  + A Bash script using `curl`, a command-line tool for transferring data specified with URL syntax, to deliver input data to the Flask application's predict endpoint.

* [Makefile](https://makefiletutorial.com/)
  + A Makefile is a tool that simplifies directions by grouping commands, that are run sequentially, together under a target name. The steps following the target name can be executed using the command `make` followed by the target name.

* [model_data/boston_housing_prediction.joblib](https://joblib.readthedocs.io/en/latest/generated/joblib.load.html)
  + Used in the Flask application to reconstruct a Python object from the pre-trained, sklearn model that has been trained to predict [housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.](https://www.kaggle.com/c/boston-housing)

* [model_data/housing.csv](https://www.kaggle.com/c/boston-housing)
  + Housing price data used to train a sklearn model to predict housing prices in Boston.

* `output_txt_files/docker_out.txt`
  + Copy of log info from the containerized Flask application (run using a Docker image) containing the prediction output from running the `make_prediction.sh` bash script.

* `output_txt_files/kubernetes_out.txt`
  + Copy of log info from Flask application (run using a Kubernetes cluster) containing the prediction output from running the `make_prediction.sh` bash script.
  + I have also included the output from the command `minikube service ml-microservice-api` before the log data from the Kubernetes cluster. A similar command is also run last as part of `run_kubernetes.sh` in order to expose the external IP Address and Port that is provisioned to access the service.

* [README.md](https://www.makeareadme.com/)
  + A README is a text file that introduces and explains a project. It contains information that is commonly required to understand what the project is about.

* [requirements.txt](https://pip.pypa.io/en/latest/user_guide/#requirements-files)
  + A Requirements file is just a list of pip install arguments placed in a file.

* `run_docker.sh`
  + A Bash script containing the set of instructions used to: Build the docker image from the Dockerfile; List the created docker images; Run the containerized Flask application; Publish the container’s port to the host.

* `run_kubernetes.sh`
  + A Bash script containing the set of instructions used to: Define the dockerfile; Run the docker container with kubectl; List the kubernetes pods; Forward the container port to a host port.

* `upload_docker.sh`
  + A Bash script containing the set of instructions used to: Define the dockerpath; Authenticate and tag the docker image; Push the docker image to [Docker Hub](https://docs.docker.com/docker-hub/).


Configuration
=============

* Clone repository and navigate into the project directory:
  ```bash
  $ git git@github.com:davidsimowitz/project-ml-microservice-kubernetes.git
  $ cd project-ml-microservice-kubernetes/
  ```

* Create a virtualenv and activate it:
  ```bash
  $ make setup
  $ source ~/.devops/bin/activate
  ```

* Run `make install` to install the necessary dependencies:
  ```bash
  $ make install
  ```


Usage
=====

* Building and Running in a Docker Container:

  + Navigate inside the project directory:
    ```bash
    $ cd project-ml-microservice-kubernetes/
    ```

  + Build the docker image and run the containerized Flask application:
    ```bash
    $ ./run_docker.sh
    ```

  + Open an additional tab or terminal and make a prediction:
    ```bash
    $ cd project-ml-microservice-kubernetes/
    $ ./make_prediction.sh
    ```

  + Stop and remove the docker container:
    * Using the CLI to obtain its CONTAINER ID to stop and remove it:
      ```bash
      $ docker container ls -a
      $ docker container stop [CONTAINER ID]
      $ docker container rm [CONTAINER ID]
      ```
    * Using the Docker Desktop application:
      ```bash
      LOAD the Dashboard
      Click the STOP button (square)
      Click the DELETE button (garbage bin)
      ```

* Deploying in a Kubernetes Cluster:

  + Navigate inside the project directory:
    ```bash
    $ cd project-ml-microservice-kubernetes/
    ```

  + Start up a local Kubernetes cluster:
    ```bash
    $ minikube start
    ```

  + Run the docker container with kubectl:
    ```bash
    $ ./run_kubernetes.sh
    ```

  + Check the pod status using the following command:
    ```bash
    $ kubectl get pods
    ```

  + Once status changes from 'ContainerCreating' to 'Running' either re-run the `run_kubernetes.sh` script or use the following command to obtain the external IP_ADDRESS and PORT that is provisioned to access the service:
    ```bash
    $ minikube service ml-microservice-api
    ```

  + Open an additional tab or terminal and make a prediction using the IP_ADDRESS and PORT values obtained in the previous step:
    ```bash
    $ cd project-ml-microservice-kubernetes/
    $ ./make_prediction.sh IP_ADDRESS PORT
    ```

  + Delete the local cluster:
    ```bash
    $ minikube delete
    ```
