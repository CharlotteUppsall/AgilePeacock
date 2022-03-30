*** Variables ***
${e-mail}  oskar.hagman@iths.se
${password}  123456789

*** Keywords ***
Start WebTest
    Open Browser  about:blank  chrome
    Go To  https://app.labelf.ai/login
    Wait Until Page Contains  Labelf
End WebTest
    Close All Browsers