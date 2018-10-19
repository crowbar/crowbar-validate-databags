node {
    stage('env') {
          sh "echo ${env.sha1}"
          sh "echo ${env.ghprbActualCommit}"
    }
    stage('rubocop') {
        build job: 'itxaka-rubocop', parameters: [string(name: 'sha1', value: '${env.sha1}')]
    }

    stage('unit tests') {
        build 'itxaka-tests'
    }
}
