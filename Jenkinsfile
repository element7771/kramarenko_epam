node('AWS_Client2') {
    def app

    stage('Clone repository locally') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
    stage('build app'){
        sh "mvn clean install"
    }
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("ikramarenko7771/kramarenko_epam")
        app.push()
    }
}

node('AWS_Client1'){

    stage('pull image'){
        sh "docker pull ikramarenko7771/kramarenko_epam"
    }
    
    stage('stop/delite all containers'){
       sh "docker stop \$(docker ps -a -q) || true"
       sh "docker rm \$(docker ps -a -q) || true"
    }

    stage('run image') {
        sh "docker-compose -f /home/ubuntu/workspace/kramarenko_epam/docker-compose.yml up -d"
    }
    
}

node('AWS_Client2'){

    stage('pull image'){
        sh "docker pull ikramarenko7771/kramarenko_epam"
    }
    
    stage('stop/delite all containers'){
       sh "docker stop \$(docker ps -a -q) || true"
       sh "docker rm \$(docker ps -a -q) || true"
    }


    stage('run image') {
        sh "docker-compose -f /home/ubuntu/workspace/kramarenko_epam/docker-compose.yml up -d"
    }
    
}
