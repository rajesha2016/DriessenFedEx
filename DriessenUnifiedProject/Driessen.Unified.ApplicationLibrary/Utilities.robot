*** Settings ***
Library    Selenium2Library


*** Variables ***
${Username}  fedexuser@driessen.nl
${Password}  Password@20181
${Browser}   Chrome
${SiteUrl}  https://test-mijn.driessen.nl/
${DashboardTitle}  Inloggen - Mijn Driessen
${ExpectedWarningMessage}  Je account is vanwege veiligheidsredenen geblokkeerd voor 15 minuten. Probeer het later alsjeblieft nogmaals.
${WarningMessage}  Login Failed!
${Response}    Get Text    //h2[contains(text(),'Welkom')]
${Delay}  5s

*** Keywords ***
Open Chrome With Options
     ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
     Call Method    ${options}    add_argument      start-maximized
     Call Method    ${options}    add_argument      disable-extensions
     Create WebDriver  Chrome     chrome_options=${options}
Open MijnDriessen
    Open Browser   url=${SiteUrl}   browser=${Browser}
Check Title
    Title Should Be   ${DashboardTitle}  
Maximize Browser
    Maximize Browser Window
Go to User Login Page
    #Execute Javascript  document.getElementsByClassName('login-control')[0].style.display='block'
    Click Link    xpath=//a[@href="http://www.kariyer.net/website/kariyerim/login.aspx"]
Enter User Name
    Input Text   xpath=//input[@id='Email']    ${Username}
    
Enter correct Password
    Input Text    //input[@id='Password']    Password@2018
Enter Wrong Password
    Input Text   //input[@id='Password']   ${Password}
Click Login
    Click Button    xpath=//button[@type='submit'][1]
Assert Warning Message
    Element Should Contain    xpath=//h2[contains(text(),'Welkom')]    Welkom