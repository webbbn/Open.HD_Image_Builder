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
    stage('Upload to Drive') {
      steps {
        sh '/var/lib/jenkins/gdrive upload --parent 1bua78EwR-gbat6O2DQO9GMwPWrd3RXoW jobs/Open.HD_Image_Builder/branches/development/builds/lastSuccessfulBuild/archive/deploy/*'
      }
    }
  }
}