*** Settings ***

Resource    ConnectionResource.robot 

*** Variables ***
@{valoresPlanilha}
${contadorLinhasPlanilha}    2
*** Keywords ***
Ler Planilha
    [Arguments]    @{keywords}
    FOR    ${linha}    IN RANGE    1    ${lengthLinhasPlanilha}
        Get Dados Da Planilha
        FOR    ${element}    IN    @{keywords}
            Run Keyword    ${element}
        END
        Run Keyword    Contador De Linhas Planilha
    END
    ${contadorLinhasPlanilha}    Set Variable    2
    Set Global Variable    ${contadorLinhasPlanilha}
    
    
Contador De Linhas Planilha
    ${contadorLinhasPlanilha}    Evaluate    ${contadorLinhasPlanilha}+1
    Set Global Variable    ${contadorLinhasPlanilha}
Fechar Planilha
    Close Current Excel Document
Abrir Planilha
    [Arguments]    ${caminhoPlanilha}
    Open Excel Document    ${caminhoPlanilha}    planilha
    @{colunaPlanilha}    Read Excel Column    1
    ${lengthLinhasPlanilha}    Get Length    ${colunaPlanilha}   
    Set Global Variable    ${lengthLinhasPlanilha}
Get Dados Da Planilha
    @{dadosPlanilha}    Read Excel Row    1
    @{dadosPlanilha2}    Read Excel Row    ${contadorLinhasPlanilha}
    @{dadosPlanilha}    Combine Lists   ${dadosPlanilha}    ${dadosPlanilha2}

    ${lengthDadosPlanilha}    Get Length    ${dadosPlanilha}
    ${lengthDadosPlanilha}    Evaluate    ${lengthDadosPlanilha}/2
    ${lengthDadosPlanilha}    Convert To Integer    ${lengthDadosPlanilha}
    
    FOR    ${counter}    IN RANGE    ${lengthDadosPlanilha}*2    ${lengthDadosPlanilha}    -1
        Insert Into List    ${valoresPlanilha}    0    ${dadosPlanilha[${counter-1}]}   
        Remove From List    ${dadosPlanilha}    ${counter-1}
    END
 
    FOR    ${index}    ${element}    IN ENUMERATE    @{dadosPlanilha}
        Set Global Variable    ${${element}}    ${valoresPlanilha[${index}]}
        
    END