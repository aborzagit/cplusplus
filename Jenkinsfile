// node {

//     stage('Preparation') { // for display purposes
//         git 'https://github.com/aborzagit/cplusplus.git'

//     }
//     stage('Build') {
//             if (isUnix()) {
//                 sh script:'''
//                 rm -rf build
//                 mkdir build
//                 cd build
//                 cmake ..
//                 make -j8
//                 '''
//             } else {
//                 bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
//             }
//         }
//     stage('Results') {
//         dir('build') {
//             sh './test_app'
//         }
//         // mail bcc: '', body: 'From pipeline', cc: '', from: '', replyTo: '', subject: 'Test pipeline email', to: 'boborozi@yahoo.com'
//         // emailext body: 'tttt', subject: 'ttt', to: 'boborozi@yahoo.com'
//       emailext (
//           to: 'boborozi@yahoo.com',
//           subject: 'Test subject',
//           body: 'Test body'
//         )
//     }
// }

pipeline {
    agent any
    
    stages {
        stage('Preparation') { // for display purposes
            steps {
                git 'https://github.com/aborzagit/cplusplus.git'
            }
        }

        stage('Build') {
            steps {
                // if (isUnix()) {
                    sh script:'''
                    rm -rf build
                    mkdir build
                    cd build
                    cmake ..
                    make -j8
                    '''
                // } else {
                //     bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
                // }
            }
        }

        stage('Results') {
            steps {
                dir('build') {
                    sh './test_app'
                }
            }
        }
    }
    post {
        always {
            // emailext body: 'A Test EMail', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
            emailext (
                to: 'boborozi@yahoo.com',
                subject: 'Test subject',
                body: "${currentBuild.currentResult}): Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
            )
        }
    }
}