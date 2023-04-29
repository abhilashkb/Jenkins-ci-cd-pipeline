node{
    stage('SCM checkout'){
        git branch: 'main', credentialsId: '3556331b-958c-41cd-b636-918833670bc2', url: 'https://github.com/abhilashkb/Jenkins-ci-cd-pipeline'
    }
    stage('Maven Package'){
        mvnHome = tool name: 'maven-3.8.7', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package"
    }
    stage('Docker build'){
        sh 'docker build -t 224574/my-app:1.0 .'
    }
    stage('Docker Push'){
         withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
          sh "docker login -u 224574 -p ${dockerhubpwd}"
       }
       sh 'docker push 224574/my-app:1.0'
    }
    stage('Run container on Dev Server'){
        def dockerrun = 'docker container run -d --name myapp -p 8080:8080 224574/my-app:1.0'
        sshagent (['dockerhost1']) {
    sh "ssh -o StrictHostKeyChecking=no -l ansadmin ${ip} -p1080 ${dockerrun}"
  }
    }
    
}