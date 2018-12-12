pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'JAVA-jdk'
    }
    stages {
        stage ('Initialize-Variables') {
            steps {
                bat '''
                    echo "PATH = %PATH%"
                    echo "M2_HOME = %M2_HOME%"
                '''
            }
        }
        stage ('Build') {
            steps {
                    bat 'mvn install'
            }
        }
        stage ('Docker-Build') {
            steps {
                    bat 'cd FSDProjectManager && mvn package docker:build'
            }
        }
    }
}
