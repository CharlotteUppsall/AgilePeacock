pipeline {
        agent any
            stages{
                stage('Test 1'){
                    steps{
                        git 'https://github.com/OSKARHAGMAN/AgilePeacock.git'
                    }
                }
   
stage('Robot Framework') {
            steps {
                bat 'robot -d Results Tests'

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
