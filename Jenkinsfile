node {
    def mvnHome = tool 'M3'

    stage('rubocop') {
        build 'itxaka-rubocop'
    }

    stage('unit tests') {
        build 'itxaka-tests'
    }
}
