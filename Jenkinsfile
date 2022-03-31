pipeline {
        agent any
            stages{
                stage('Checkout'){
                    steps{
                        git 'https://github.com/CharlotteUppsall/AgilePeacock.git'
                    }
                }
            stage ('Build'){
                steps {
                    bat 'mvn compile'
                   }
                }
          
stage('Robot Framework System tests with Selenium') {
            steps {
                bat 'robot -d Results  Tests'

            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        }
       }
    }
