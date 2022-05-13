pipeline {
        agent any
            stages{
               
   

stage('AG-52 & AG_56') {
            steps {
                    
                sh 'robot -d Results Tests/AG-56.robot'
                sh 'robot -d Results Tests/AG-95.robot'
                sh 'robot -d Results Tests/AG-52.robot'
                
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
