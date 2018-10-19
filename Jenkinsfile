pipeline {
    node {
        parameters {
            string(name: 'sha1', value: "${env.sha1}")
            string(name: 'ghprbActualCommit', value: "${env.ghprbActualCommit}")
            string(name: 'ghprbTargetBranch', value: "${env.ghprbTargetBranch}")
        }
        stage('env') {
            sh "printenv"
        }
        stage('rubocop') {
            script {
                def myparams = currentBuild.rawBuild.getAction(ParametersAction).getParameters()
                build job: 'itxaka-rubocop', parameters: myparams
            }  
        }
        stage('unit tests') {
            build 'itxaka-tests'
        }
    }
}
