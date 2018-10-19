stage('1') {
  build job: 'itxaka-rubocop', parameters: [string(name: 'sha1', value: '${sha1}')]
}
stage('2') {
  build job: 'itxaka-tests', parameters: [string(name: 'sha1', value: '${sha1}')]
}

