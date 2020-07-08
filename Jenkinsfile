node {
    stage('Build') {
        // Build and Test
        sh 'xcodebuild -scheme "iOSUI-Example" -configuration "Debug" build'
        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }

    stage('Test') {
        // Build and Test
        sh 'xcodebuild -scheme "iOSUI-Example" -configuration "Debug" test -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }
}
