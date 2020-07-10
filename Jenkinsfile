pipeline {
    agent any

    stages {
        stage('Bundle install') {
            steps {
                echo "********* BUNDLE INSTALL *********"
                sh 'source ~/.bashrc'
                sh 'bundle install'
            }
        }
        stage('Build') {
            steps {
                echo "********* iOSUI DEBUG *********"
                sh 'bundle exec fastlane iOSUI_build'
            }
        }

        stage('Test') {
            steps {
                echo "********* iOSUI Test *********"
                sh 'bundle exec fastlane iOSUI_test'
            }
        }
    }
}