*** Settings ***
Library  SeleniumLibrary
Resource  Resources/openCloseBrowser.robot
Variables  Variables/categories.py
Variables  Variables/contactForm.py

*** Test Cases ***
Go to Contact page
    [tags]  contactPage
    Go To Website
    Wait Until Element Is Enabled     ${contactElement}
    Click Link    ${contactElement}
    Page Should Contain   New message
    Close Browser

Submit Contact form
    [tags]   contactForm
    Go To Website
    Click Link    ${contactElement}
    Wait Until Element Is Enabled     ${emailElement}
    Input text    ${emailELement}    ${email}
    Input text      ${nameElement}   ${name}
    Input text      ${descriptionElement}     ${description}
    Click Button    ${submitFormElement}
    Handle Alert    ACCEPT
    Close Browser

Go to Phone Category Page
    [tags]  phoneCategory
    Go To Website
    Page Should Contain     CATEGORIES
    Click link      ${phoneSection}
    Wait Until Element Is Enabled   ${samsungGalaxyS6}
    Page Should Contain Element     ${samsungGalaxyS6}
    Close Browser


Select Monitor
    Go To Website
    Wait Until Element Contains   "(//a[normalize-space()='Monitors'])[1]"    5
    Click link    "//a[normalize-space()='Monitors'])[1]"
    Wait Until Element Is Enabled   "//a[normalize-space()='Apple monitor 24']"
    Page Should Contain Element     "//a[normalize-space()='Apple monitor 24']"
    Close Browser


