*** Settings ***

Resource    ../../Resource/ConnectionResource.robot

*** Variables ***
# LOCATORS
# Home page
${lBtnAddCustomer}                    //a[@class='btn btn-default'][contains(.,'Add Customer')]

# Page Formulário
${lFormCustomerName}                  //input[@id='field-customerName']
${lFormContactLastName}               //input[@id='field-contactLastName']
${lFormContactFirstName}              //input[@id='field-contactFirstName'] 
${lFormPhone}                         //input[@id='field-phone']
${lFormAddressLine1}                  //input[@id='field-addressLine1']
${lFormAddressLine2}                  //input[@id='field-addressLine2']
${lFormCity}                          //input[@id='field-city']
${lFormState}                         //input[@id='field-state']
${lFormPostalCode}                    //input[@id='field-postalCode']
${lFormCountry}                       //input[@id='field-country']

${lFormCbxSalesRepEmployee}           //div[@id="field_salesRepEmployeeNumber_chosen"]
${lFormTxtSalesRepEmployee}           //input[@autocomplete='off']

${lFormCreditLimit}                   //input[@id='field-creditLimit']
${lFormDeleted}                       //input[@id='field-deleted']

${lBtnSaveForm}                       //button[@id='form-button-save']
${lLblConfimacaoCadastro}             //div[@id='report-success']

*** Keywords ***
Acessar home page "${url}"
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window

Clicar no botão "Add Customer"
    Wait Until Element Is Visible    ${lBtnAddCustomer}
    Click Element                    ${lBtnAddCustomer}

Preencher formulário
    Wait Until Element Is Visible    ${lFormCustomerName}
    Input Text                       ${lFormCustomerName}                  ${customerName}
    Input Text                       ${lFormContactLastName}               ${contactLastName}
    Input Text                       ${lFormContactFirstName}              ${contactFirstName}
    Input Text                       ${lFormPhone}                         ${phone}
    Input Text                       ${lFormAddressLine1}                  ${addressLine1}
    Input Text                       ${lFormAddressLine2}                  ${addressLine2}
    Input Text                       ${lFormCity}                          ${city}
    Input Text                       ${lFormState}                         ${state}
    Input Text                       ${lFormPostalCode}                    ${postalCode}
    Input Text                       ${lFormCountry}                       ${country}
    Preencher from employeer
    Input Text                       ${lFormCreditLimit}                   ${creditLimit}
    Input Text                       ${lFormDeleted}                       ${deleted}

Preencher from employeer
    Set Global Variable              ${lFormItemSalesRepEmployee}          //li[@class='active-result highlighted'][contains(.,'${salesRepEmployee}')]
    Click Element                    ${lFormCbxSalesRepEmployee}
    Wait Until Element Is Visible    ${lFormTxtSalesRepEmployee}
    Input Text                       ${lFormTxtSalesRepEmployee}           ${salesRepEmployee}
    Wait Until Element Is Visible    ${lFormItemSalesRepEmployee}
    Click Element                    ${lFormItemSalesRepEmployee}

# === GHERKIN STEPS ===
Dado que estou na home page "${url}"
    Acessar home page "${url}"

Quando clico no botão "Add Customer"
    Clicar no botão "Add Customer"

E preencho o formulário
    Preencher formulário

E clico no botão "Save"
    Click Element    ${lBtnSaveForm}
    
Então recebo a confirmação de customer salvo com sucesso
    Wait Until Element Is Visible    ${lLblConfimacaoCadastro}
    Wait For Condition    value = document.querySelector("#field-customerName").value; return value == ""
    
