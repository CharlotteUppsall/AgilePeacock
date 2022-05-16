pipeline {
        agent any
            stages{
               
   
                    stage('Delete Old Screenshots'){
                            steps{
                          sh 'sudo rm Results/selenium-screenshot-*.png'  
                          }
                    }

                    stage('AG_56') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results Tests/AG-56.robot' }
              
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-56-output.xml',
                                          reportFileName      : '**/AG-56-report.html',
                                          logFileName         : '**/AG-56-log.html',
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
                    
stage('AG-95') {
            steps {      

                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
                sh 'robot -d Results Tests/AG-95.robot'
                    }
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-95-output.xml',
                                          reportFileName      : '**/AG-95-report.html',
                                          logFileName         : '**/AG-95-log.html',
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
                    
stage('AG-52') {
            steps {      
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){

                sh 'robot -d Results Tests/AG-52.robot'
                   }
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-52-output.xml',
                                          reportFileName      : '**/AG-52report.html',
                                          logFileName         : '**/AG-52log.html',
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
