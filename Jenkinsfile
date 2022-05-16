pipeline {
        agent any
            stages{
               
   
                    stage('Delete Old Screenshots'){
                            steps{
                          sh 'sudo rm Results/selenium-screenshot-*.png'  
                          }
                    }
                    
                    stage('AG_18') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results -o AG-18-output -l AG-18-log -r AG-18-report Tests/AG-18.robot' }
              
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-18-output.xml',
                                          reportFileName      : '**/AG-18-report.html',
                                          logFileName         : '**/AG-18-log.html',
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
                    
                    stage('AG_51') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results -o AG-51-output -l AG-51-log -r AG-51-report Tests/AG-51.robot' }
              
                
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/AG-51-output.xml',
                                          reportFileName      : '**/AG-51-report.html',
                                          logFileName         : '**/AG-51-log.html',
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

                    stage('AG_56') {
        steps {   
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')  { 
                

                sh 'robot -d Results -o AG-56-output -l AG-56-log -r AG-56-report Tests/AG-56.robot' }
              
                
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
                sh 'robot -d Results -o AG-95-output -l AG-95-log -r AG-95-report Tests/AG-95.robot'
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

                sh 'robot -d Results -o AG-52-output -l AG-52-log -r AG-52-report Tests/AG-52.robot'
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
                                          reportFileName      : '**/AG-52-report.html',
                                          logFileName         : '**/AG-52-log.html',
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
