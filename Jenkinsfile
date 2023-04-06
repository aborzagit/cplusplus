node {

    stage('Preparation') { // for display purposes
        git 'https://github.com/aborzagit/cplusplus.git'

    }
    stage('Build') {
            if (isUnix()) {
                sh script:'''
                rm -rf build
                mkdir build
                cd build
                cmake ..
                make -j8
                '''
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    stage('Results') {
        dir('build') {
            sh './test_app'
        }
        // mail bcc: '', body: 'From pipeline', cc: '', from: '', replyTo: '', subject: 'Test pipeline email', to: 'boborozi@yahoo.com'
        // emailext body: 'tttt', subject: 'ttt', to: 'boborozi@yahoo.com'
      emailext (
          to: 'boborozi@yahoo.com',
          subject: 'Test subject',
          body: 'Test body'
        )
    }
    
    post {
        always{
            emailext (
                to: 'boborozi@yahoo.com',
                subject: 'Test subject',
                body: 'Test body'
            )
        }
    }
}