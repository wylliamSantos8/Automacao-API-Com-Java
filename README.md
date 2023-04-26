# **Documentação de utilização do Framework **

# Como configurar o ambiente para execução dos testes:

1. Instalar o JDK8
2. Instalar o Maven : https://dicasdejava.com.br/como-instalar-o-maven-no-windows/
3. Configurar as variaveis de ambiente : https://confluence.atlassian.com/confbr1/configurando-a-variavel-java_home-no-windows-933709538.html
4. Importar o projeto para a IDE de desenvolvimento(Eclipse ou Intellij Idea).

# Como executar os testes no framework:

1. Acessar a pasta src/test/java/sicredi/runners
2. Abrir o arquivo runner que deseja executar
3. Clicar com Botão Direito e selecionar a opção Run

### Relatório 

1. Após a execução da Runner, um relatório é gerado na pasta target -> reports.

###Consulta de Restrições
Tem a finalidade de consultar o CPF informando, retornando se ele possui ou não uma restrição.
*Endpoint*: GET <host>/api/v1/restricoes/{cpf}

| Regra | Valor esperado |
| ------ | ------ |
| Não possui restrição | StatusCode 204 é retornado |
| Possui restrição |StatusCode 200 e mensagem "O CPF 99999999999 possui restrição" |


###Cadastro de Simulações
Cadastro de informações importantes sobre o crédito como valor, parcelas, dados de contato, entre outros.
*Endpoint*: POST <host>/api/v1/simulacoes

| Regra | Valor esperado |
| ------ | ------ |
| Cadastro realizado com sucesso | StatusCode 201 é retornado e dados inseridos como retorno |
| Cadastro não obedece regras de negócio |StatusCode 400 e lista de erros|
| Cadastro para CPF já informado anteriormente | StatusCode 409 e mensagem "CPF já existente" |

###Alterar Simulações
Altera uma simulação já existente, onde o CPF deve ser informado para que a alteração possa ser efetuada.
*Endpoint*: PUT <host>/api/v1/simulacoes/{cpf}

| Regra | Valor esperado |
| ------ | ------ |
| A alteração pode ser feita em qualquer atributo da simulação | Alterações concluidas com sucesso |
| CPF informado não possui simulação |StatusCode 404 e mensagem de erro "CPF não encontrado" |

###Consultar Simulações
Lista as simulações cadastradas. 
*Endpoint*: GET <host>/api/v1/simulacoes

| Regra | Valor esperado |
| ------ | ------ |
| Fluxo positivo | Retorna a lista de simulações cadastradas e existir uma ou mais |
| Não encontrar simulações |StatusCode 204  |

###Consultar Simulações por CPF
Retorna a simulação previamente cadastrada pelo CPF.
*Endpoint*: GET <host>/api/v1/simulacoes/{cpf}

| Regra | Valor esperado |
| ------ | ------ |
| CPF válido | Retorna a simulação cadastrada |
| Não encontrar simulações |StatusCode 404  |

###Remover Simulações por ID
Remove uma simulação previamente cadastrada pelo seu ID.
*Endpoint*: DELETE <host>/api/v1/simulacoes/{id}

| Regra | Valor esperado |
| ------ | ------ |
| ID Válido | StatusCode 204 se removido com sucesso|
| Não encontrar simulações |StatusCode 404 e mensagem "Simulação não encontrada"  |

## Plugins

| Plugin | Mais informações |
| ------ | ------ |
| Cucumber | [https://plugins.jetbrains.com/plugin/7212-cucumber-for-java]|
| Gherkin | [https://plugins.jetbrains.com/plugin/9164-gherkin] |
| Java SDK | 1.8 version 1.8.0_301 |

## Dependências
| Plugin | Mais informações |
| ------ | ------ |
| Rest-Assured | [https://mvnrepository.com/artifact/io.rest-assured/rest-assured]|
| Cucumber | [https://mvnrepository.com/artifact/io.cucumber] |
| JUnit | [https://mvnrepository.com/artifact/io.cucumber/cucumber-junit] |
| JavaFaker | [https://mvnrepository.com/artifact/com.github.javafaker/javafaker] |
| OKHTTP | [https://mvnrepository.com/artifact/com.squareup.okhttp3/okhttp] |

## Problemas encontrados
| Feature | Cenário | Problema abordado | Valor esperado |
| ------ | ------ |  ------ | ------ |
| alterarSimulacoes | Deve atualizar uma simulação existente através do CPF para campo VALOR |  Campo não permite alterações | Permitir alterações |
| alterarSimulacoes | Validar status de erro para formato de CPF informado para atualização de simulação |  Permite inserção de valores contendo mascaras | Permitir apenas valores exclusivamente numerais |
| alterarSimulacoes | Validar status de erro para atualização de simulação para campo "valor" menor que R$ 1.000 | Campo não permite alterações | Permitir alterações |
| alterarSimulacoes | Validar status de erro para atualização de simulação para campo "valor" maior que R$ 40.000 | Campo não permite alterações | Permitir alterações |
| alterarSimulacoes | Validar atualização de simulação para campo "valor" igual a R$ 1.000 | Campo não permite alterações | Permitir alterações |
| alterarSimulacoes | Validar atualização de simulação para campo "valor" igual a R$ 40.000 | Campo não permite alterações | Permitir alterações |
| alterarSimulacoes | Validar status de erro para status de erro para atualização de simulação para campo "parcela" maior que 48 | Campo permite valores acima de 48 | Campo deve permitir apenas valores entre 2 e 48 |
| alterarSimulacoes | Validar status de erro para atualização de simulação para campo "seguro" diferente de true ou false | Campo permite valores diferentes de "true" e "false" | Campo deve permitir apenas valores booleanos |
| alterarSimulacoes | Validar status de erro para alteração em simulação com CPF não encontrado | Retorno statusCode 400 | Retorno statusCode 404 |
| cadastrarSimulacoes | Validar status de erro para formato de CPF informado para cadastro de nova simulação | Campo permite inserção de valores com máscaras | Permitir apenas valores exclusivamente numerais |
| cadastrarSimulacoes | Validar formato de EMAIL informado para cadastro de nova simulação | Retornando mensagens de erro diferentes | Retornando mensagens diferentes, conforme explicado em item MELHORIAS A SEREM ABORDADAS |
| cadastrarSimulacoes | Validar status de erro para cadastro de simulação para campo "valor" menor que R$ 1.000 | Retorno statusCode 201 e item cadastrado | Campo deve permitir apenas valores entre 1000 e 40000 |
| cadastrarSimulacoes | Validar cadastro de simulação para campo "parcela" maior que 48 | Retorno statusCode 201 e Item cadastrado | Campo deve permitir apenas valores entre 2 e 48 |
| cadastrarSimulacoes | Validar status de erro para tentativa de cadastro de nova simulação para CPF já cadastrado | Retorno statusCode 400 e mensagem "CPF duplicado" | Retorno 409 e mensagem "CPF já existente" |
| consultarRestricoes | Deve retorna status de pessoa com restrição corretamente | Retorno mensagem "O CPF 97093236014 tem problema" | Retorno de mensagem "O CPF 97093236014 possui restrição" |
| consultarSimulacoes | Validar status de erro para existência de dados em lista a serem exibidos | Retorno statusCode 200 | Retorno statusCode 204 |
| removerSimulacoes | Deve remover simulação existente através do ID com sucesso | Retorno statusCode 200 | Retorno statusCode 204 |
| removerSimulacoes | Deve retornar status de erro para simulação não encontrada | Retorno statusCode 200 | Retorno statusCode 404|
 
## Melhorias a serem abordadas
| Feature | Cenário | Melhoria |
| ------ | ------ | ------ |
| alterarSimulacoes | Validar formato de EMAIL informado para atualização de simulação | Mensagem em lista de erros diverge entre "E-mail deve ser um e-mail válido" e "não é um endereço de e-mail". A fim tornar sua validação mais assertiva, seria o ideal apenas uma mensagem por padrão. |
