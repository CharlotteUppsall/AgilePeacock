*** Variables ***
${password}  123456789
# ${Main_Page} - se om den behövs
${workspace_menu}   //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_hello}   //*[@id="app"]/div[6]/div/div[2]/div[5]/a/div[1]
${model_overview_button}   //*[@id="app"]/div[9]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/div[2]/a/div
${scroll_to_element}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[3]/nav/div/span/button/div
${button_continue_connect_dataset}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[2]/div[1]/div/div/div[2]/button/div
${button_connect}   //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div


*** Keywords ***


AG_88 User Can Confirm Button "Connect Additional Dataset" Is Shown In Model Overview Page
# Scroll Element Into View

AG_91 User Can Confirm The Connected Dataset Is Listed Under Connected Datset On Model Overview Page