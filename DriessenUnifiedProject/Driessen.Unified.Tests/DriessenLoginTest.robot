*** Settings ***
Resource  ../Driessen.Unified.ApplicationLibrary/Utilities.robot
Suite Teardown    Close Browser

*** Variable ***
*** Test Cases ***
Login Should Failed With Wrong Username and Password
    [TAGS]  Failed_MijnDriessen_Login_Test
    Open MijnDriessen
    Maximize Browser
    sleep    ${Delay}
    Enter User Name
    Enter Wrong Password
    Click Login
    sleep    ${Delay}
    Assert Warning Message
    
*** Keyword ***