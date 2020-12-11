pipeline {
    agent any

    environment {
        LC_ALL = 'en_US.UTF-8'
        LANG    = 'en_US.UTF-8'
    }

    stages {
        stage('Bundle install') {
            steps {
                echo "********* BUNDLE INSTALL *********"
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