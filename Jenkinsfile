node {
    environment {
        ghprbTargetBranch = env.ghprbTargetBranch
        ghprbActualCommit = env.ghprbActualCommit
    }
    stage('env') {
        sh "echo 'sha=${env.sha1}'"
        sh "echo 'actualcommit=${ghprbActualCommit}'"
        sh "echo 'targetBranch=${ghprbTargetBranch}'"
    }
    stage('rubocop') {
        build job: 'itxaka-rubocop', parameters: [string(name: 'sha1', value: "${env.sha1}")]
    }

    stage('unit tests') {
        build 'itxaka-tests'
    }
}
