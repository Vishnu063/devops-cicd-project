pipeline {
  agent any
  stages {
    stage('Deploy') {
      steps { sh 'cd /home/ubuntu/activepieces && docker compose up -d' }
    }
    stage('Health check') {
      steps { sh 'sleep 30; curl -sf -o /dev/null -w "HTTP %{http_code}\\n" http://172.17.0.1:8080' }
    }
  }
}
