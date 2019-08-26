pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'sudo ./build.sh'
      }
    }
    stage('Compress') {
      steps {
        sh 'gzip deploy/*.img'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: 'deploy/*.gz', onlyIfSuccessful: true)
      }
    }
    stage('Cleanup') {
      steps {
        sh 'rm -rf deploy/*'
      }
    }
  }
}