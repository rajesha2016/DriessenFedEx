*** Settings ***
Resource  ../Driessen.Unified.ApplicationLibrary/Utilities.robot
Suite Teardown    Close Browser

*** Variable ***
*** Test Cases ***
Login Should Failed With Wrong Username and Password
    [TAGS]  Failed_MijnDriessen_Regression_Test
    Given Open MijnDriessen
    Maximize Browser
    sleep    ${Delay}
    Enter User Name
    Enter Wrong Password
    Click Login
    Sleep    ${Delay}    
    Close Browser instance
    
 *** Test Cases ***
Login Should Pass With correct Username and Password
    [TAGS]  MijnDriessen_Regression_Test
    Open MijnDriessen
    Maximize Browser
    sleep    ${Delay}
    Enter User Name
    Enter correct Password
    Click Login
    sleep    ${Delay}
    Assert Warning Message
    
*** Keyword ***