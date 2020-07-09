node {

	stage('Bundle Install') {
		step {
			script{
				echo "********* BUNDLE INSTALL *********"
        		sh 'bundle install'
			}
		}
       
    }

    stage('Build') {
    	step {
    		script {
    			echo "********* BUILD DEBUG CONFIG *********"
        		sh 'bundle exec fastlane build_debug'
    		}
    	}
    }
}
