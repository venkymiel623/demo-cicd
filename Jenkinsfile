// Jenkinsfile

pipeline {
    agent any
    
    environment {
	DOCKER_IMAGE = 'my-python-app'
	ARTIFACTORY_REPO_URL = 'docker.io/venkymiel623'
    }
    stages {
	stage('Build Docker Image') {
	    steps {
		script {
		    // Build the Docker image 
		    sh "docker build -t ${DOCKER_IMAGE} ."
     		}
	    }
        }
	stage('Tag Docker Image') {
	    steps {
                script {
                    // Tag Docker Image
                    sh "docker tag ${DOCKER_IMAGE} ${ARTIFACTORY_REPO_URL}/${DOCKER_IMAGE}:latest"
                }
            }
        }
	stage('Push to Artifcatory') {
            steps {
                script {
                    // Log in to Artifactory
                    sh "docker login -u savenkateswarlu02@gmail.com -p Venky&Ammu143 ${ARTIFACTORY_REPO_URL}"
		    // Push the Docker image to Artifactory
		    sh "docker push ${ARTIFACTORY_REPO_URL}/${DOCKER_IMAGE}:latest"
                }
            }
        }
     }
  }
