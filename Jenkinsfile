pipeline{
    agent any
    environment {
        IMAGE_NAME= "amar90224/my-images"
    }
    stages{
        stage("Docker Login"){
            steps{
                withCredentials([usernamePassword(credentialsId:'dockercreds',usernameVariable:'DOCKER_USER_NAME',passwordVariable:"DOCKER_PASSWORD")]){
                    sh '''
                    echo "$DOCKER_PASSWORD" | docker login -u $DOCKER_USER_NAME --password-stdin
                    echo 'login succesfully'
                    '''  
                }
            }   
        }

        stage("Build and Image push to dockerhub"){
            steps{
                sh "docker build -t ${env.IMAGE_NAME}:${env.BUILD_ID} ."
                sh "docker push ${env.IMAGE_NAME}:${env.BUILD_ID}" 
            }
        }

        stage('Approval Required') {
            steps {
                script {
                    def userInput = input(id: 'userInput', message: 'Approve and Provide docker image', parameters: [
                        string(name: 'DOCKER_IMAGE', defaultValue: 'defaultValue', description: 'Enter the docker image')
                    ])
                    env.DOCKER_IMAGE = userInput
                }
            }
	    }
    }

    post{
        always{
            sh "docker logout"
        }
    }
}    