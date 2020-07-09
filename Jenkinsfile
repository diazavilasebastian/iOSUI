pipeline {
    agent any

    stages {
        stage('Bundle install') {
            steps {
                echo "********* BUNDLE INSTALL *********"
        		sh 'bundle install'
            }
        }
        stage('Build') {
            steps {
                echo "********* BUILD DEBUG CONFIG *********"
        		sh 'bundle exec fastlane build_debug'
            }
        }
    }
}