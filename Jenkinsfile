pipeline {
    agent any
    parameters {
        string(name: 'sha1', value: "${env.sha1}")
        string(name: 'ghprbActualCommit', value: "${env.ghprbActualCommit}")
        string(name: 'ghprbTargetBranch', value: "${env.ghprbTargetBranch}")
    }
    stages {    
        stage('env') {
            steps {
                printenv
            }
        }
        stage('rubocop') {
            steps {
                script {
                    def myparams = currentBuild.rawBuild.getAction(ParametersAction).getParameters()
                    build job: 'itxaka-rubocop', parameters: myparams
                }
            }
        }
        stage('unit tests') {
            streps {
                build 'itxaka-tests'
            }
        }
    }  
}
