# Cadastros a partir de planilhas

## ==== Sobre o projeto ====
- O seguinte projeto tem como obetivo cadastrar customers em um formulário de testes com as informações de uma planilha, sendo que a quantidade de linhas que a planilha possuir, será a quantidade de cadastros a serem realizados

## ==== Requisitos para rodar o projeto ====
1. Deve possuir o Python instalado. <a href='https://www.python.org/downloads/'>Clique aqui para fazer o download do Python.</a>
2. Deve possuir o Robot Framework e as libraries Selenium e Excellib instaladas. Para instala-las basta colar os seguintes comandos no Prompt de Comando do windows.

        pip install robotframework
        pip install robotframework-seleniumlibrary
        pip install robotframework-excellib

3. Deve possuir o webdriver do navegador que deseja rodar o teste dentro da pasta Scripts no diretório onde o Python está instalado. 

## ==== Como rodar o projeto ====
- Basta abrir o Prompt de Comando no diretório raiz do projeto e executar o seguinte comando.

        robot -d Results/GroceryCRUD Cenarios/GroceryCRUD/GroceryCRUD.robot

## ==== Visualizar resultados da execução ====
- Após rodar o projeto com a linha de comando acima será criado um diretório "Reports\GroceryCRUD" dentro da raiz do projeto, com os relatórios da execução do teste.
