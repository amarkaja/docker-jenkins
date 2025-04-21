pipeline{
    agent any
    environment {
        IMAGE_NAME= "amar90224/my-images"
    }
    stages{
        stage("docker build"){
            steps{
                sh "docker build -t ${env.IMAGE_NAME}:${env.BUILD_ID} ."
                sh "docker images"
            }  
        }

        stage("Docker Login"){
            steps{
                withCredentials([usernamePassword(credentialsId:'dockercreds',usernameVariable:'DOCKER_USER_NAME',passwordVariable:"DOCKER_PASSWORD")]){
                    sh '''
                    echo "$DOCKER_PASSWORD" | docker login -u $DOCKER_USER_NAME -password-stdin
                    echo 'login succesfully'
                    '''
                  
                }

            }
        }
    }
}