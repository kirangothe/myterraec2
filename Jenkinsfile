pipeline {

    parameters {
        string(name: 'AWS_ACCESS_KEY_ID', defaultValue: '', description: 'AWS Access Key ID')
        string(name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '', description: 'AWS Secret Access Key')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kirangothe/myterraec2.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'cd terraformpipeline && terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'cd terraformpipeline && terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.autoApprove }
            }
            steps {
                sh 'cd terraformpipeline && terraform apply -auto-approve tfplan'
            }
        }
    }
}
