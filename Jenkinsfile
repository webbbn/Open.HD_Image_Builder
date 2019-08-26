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
        sh 'sudo gzip deploy/*.img'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: 'deploy/*.gz', onlyIfSuccessful: true)
      }
    }
    stage('Cleanup') {
      steps {
        sh 'sudo rm -rf deploy/*'
      }
    }
    stage('Change Ownership') {
      steps {
        sh 'sudo chown -R jenkins.jenkins .'
      }
    }
  }
}