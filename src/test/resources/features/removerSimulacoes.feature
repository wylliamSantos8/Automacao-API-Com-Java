#language:pt
Funcionalidade: Remove uma simulação previamente cadastrada

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenario: Deve remover simulação existente através do ID com sucesso
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando inserir parâmetros para remoção de simulação para ID informado
      E finalizar envio de informações para remoção
      E deve exibir statusCode 204
      E inicio de consulta por simulações para CPF informado
      E finalizar envio de informações para consulta por CPF
      Então deve retornar status 404
      E mensagem de erro

    #Regra: Deve retornar HTTP Status 404
    @Teste
    Cenario: Deve retornar status de erro para simulação não encontrada
      Dado insiro parâmetros para remoção de simulação para ID não cadastrada
      Quando finalizar envio de informações para remoção
      Então deve exibir statusCode 404
      E mensagem "Simulação não encontrada"