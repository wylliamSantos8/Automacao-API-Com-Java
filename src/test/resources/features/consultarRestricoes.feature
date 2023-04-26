#language:pt
  Funcionalidade: Consultar o CPF informando, retornando se ele possui ou não uma restrição

    #Regra: Se não possui restrição do HTTP Status 204 é retornado
    #Erro: Não encontrei massa para testes em aplicação
    @Teste
    Cenario: Deve retorna status de pessoa sem restrição corretamente
      Dado inicio de pesquisa
      Quando informo CPF de pessoa sem restrição
      Então deve retornar statusCode 204

    #Regra: Se possui restrição o HTTP Status 200 é retornado com a mensagem "O CPF 99999999999 possui restrição"
    @Teste
    Esquema do Cenario: Deve retorna status de pessoa com restrição corretamente
      Dado inicio de pesquisa
      Quando informo CPF de pessoa com restrição
        | CPF   |
        | <CPF> |
      Então deve retornar statusCode 200
      E mensagem O CPF <CPF> possui restrição

      Exemplos:
        | CPF         |
        | 97093236014 |
        | 60094146012 |
        | 84809766080 |
        | 62648716050 |
        | 26276298085 |
        | 01317496094 |
        | 55856777050 |
        | 19626829001 |
        | 24094592008 |
        | 58063164083 |



