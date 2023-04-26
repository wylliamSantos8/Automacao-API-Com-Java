#language:pt
Funcionalidade: Consultar Simulacões de acordo com parâmetros informados

    #Regra: Deve retornar HTTP Status 200 / Campos obrigatórios: nome, cpf, email, valor, parcelas e seguro
    @Teste
    Cenario: Deve retornar todas as simulações existentes
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Então inicio de consulta por simulações existentes
      E finalizar envio de informações para consulta
      Então deve retornar status 200
      E lista contendo dados de operações

    #Regra: Retorna HTTP Status 204 se não existir simulações cadastradas
    @Teste
    Cenario: Deve retornar statusCode 204 quando não existir dados em lista a serem exibidos
      Dado que removo todos os registros informados em lista
      Quando inicio nova consulta por simulações existentes
      E finalizar envio de informações para consulta
      Então deve retornar status 204

    #Regra: Deve retornar HTTP Status 200 / Campos obrigatórios: nome, cpf, email, valor, parcelas e seguro
    @Teste
    Cenario: Deve retornar uma simulação através do CPF
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Então inicio de consulta por simulações para CPF informado
      Quando finalizar envio de informações para consulta por CPF
      Então deve retornar status 200

    #Regra: Deve retornar HTTP Status 404
    @Teste
    Cenario: Deve retornar erro quando não encontrar simulação com parâmetros informados
      Dado inicio de consulta para CPF não cadastrado
      Quando finalizar envio de informações para consulta por CPF
      Então deve retornar status 404
      E mensagem de erro
