*** Settings ***

Resource   GroceryCRUD_resource.robot

Suite Setup        Abrir Planilha     Cenarios/GroceryCRUD/GroceryCRUD.xlsx
Suite Teardown     Fechar Planilha

*** Variables ***
@{stepsPlanilha}    E preencho o formulário    E clico no botão "Save"    Então recebo a confirmação de customer salvo com sucesso 

*** Test Cases ***
Cadastrar customers     
    Dado que estou na home page "https://www.grocerycrud.com/v1.x/demo/bootstrap_theme"
    Quando clico no botão "Add Customer"
    Ler Planilha    @{stepsPlanilha}
    Close Browser
    
    

