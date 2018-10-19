node {
    stage('env') {
          sh "echo ${env}"
          sh "echo ${env.sha1}"
          sh "echo ${env.ghprbActualCommit}"
    }
    stage('rubocop') {
        build 'itxaka-rubocop'
    }

    stage('unit tests') {
        build 'itxaka-tests'
    }
}
