pipeline {
        agent any
            stages{
               
   
stage('All Tests') {
            steps {
                sh'robot -d Results Tests/AG-16.robot'
                sh 'robot -d Results Tests/AG-51.robot'
                sh 'robot -d Results Tests/AG-18.robot'
                
                

                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
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
