node {
    paramAValue = ${env.sha1}
    stage('env') {
          sh "echo ${env.sha1}"
          sh "echo ${env.ghprbActualCommit}"
    }
    stage('rubocop') {
        build job: 'itxaka-rubocop', parameters: [string(name: 'sha1', value: paramAvalue)]
    }

    stage('unit tests') {
        build 'itxaka-tests'
    }
}
