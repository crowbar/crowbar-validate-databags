node {
    stage('rubocop') {
        build job: 'itxaka-rubocop', parameters: [
            string(name: "sha1", value: "${env.sha1}"), 
            string(name: "ghprbActualCommit", value: "${env.ghprbActualCommit}"), 
            string(name: "ghprbTargetBranch", value: "${env.ghprbTargetBranch}")
        ]
    }
    stage('unit tests') {
        build job: 'itxaka-tests', paremeters: [string(name: "sha1", value: "${env.sha1}")]
    }
}
