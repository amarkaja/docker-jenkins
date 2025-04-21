pipeline{
    agent any
    stages{
        stage("docker build"){
            steps{
                sh "docker build -t amar90224/my-images:${env.GIT_COMMIT} ."
                sh "docker images"
            }  
        }
    }
}