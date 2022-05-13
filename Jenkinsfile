pipeline {
        agent any
            stages{
                  
                    stage('Remove Screenshots') {
                               # path: /usr/bin/chromedriver.rb

                        require 'selenium/webdriver'
                        require 'capybara-screenshot/rspec'

                        Capybara.javascript_driver = :selenium_chrome_headless
                        Capybara::Screenshot.capybara_tmp_path = "tmp/screenshots" # <-- change this if your screenshots are located elsewhere

                        Capybara::Screenshot.register_driver(:selenium_chrome_headless) do |driver, path|
                        driver.browser.save_screenshot(path)
                        end
                    # path: spec/rails_helper.rb

                        RSpec.configure do |config|
                         # code omitted for brevity
  
                         config.before(:all) do
                           Capybara::Screenshot::Pruner.new(:keep_last_run).prune_old_screenshots
                          end
                            end }
               

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
