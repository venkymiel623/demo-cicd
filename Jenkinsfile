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
                    sh "docker login -u venkymiel623 -p Venkymiel ${ARTIFACTORY_REPO_URL}"
		    // Push the Docker image to Artifactory
		    sh "docker push ${ARTIFACTORY_REPO_URL}/${DOCKER_IMAGE}:latest"
                }
            }
        }
	 stage('Deploy to EC2') {
             steps {
                 script {
                     // Connect to your EC2 instance (replace EC2_INSTANCE_IP with your instance's public IP)
                     sh "ssh --i "aws-demo.pem" ec2-user@ec2-3-110-81-23.ap-south-1.compute.amazonaws.com 'docker pull ${ARTIFACTORY_REPO_URL}/${DOCKER_IMAGE}:latest'"
                     sh "ssh --i "aws-demo.pem" ec2-user@ec2-3-110-81-23.ap-south-1.compute.amazonaws.com 'docker run -d -p 80:80 ${ARTIFACTORY_REPO_URL}/${DOCKER_IMAGE}:latest'"
                  }
              }
          }
      }
  }
