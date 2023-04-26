#language:pt
  Funcionalidade: Cadastrar Simulacões de acordo com parâmetros informados

    #Regra: Cadastro completo ~ Fluxo Positivo
    #Regra: Booleano true se com seguro e false se sem seguro
    @Teste
    Cenario: Deve inserir uma nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      Então deve retornar statusCode 201
      E informações cadastradas

    #Regra: Erros para não envio de campos obrigatórios
    @Teste
    Cenario: Validar status de erro para não envio de campo obrigatório CPF em cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir conjunto de dados para campo CPF nulo
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo CPF "CPF não pode ser vazio"

    @Teste
    Cenario: Validar status de erro para não envio de campo obrigatório NOME em cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir conjunto de dados para campo NOME nulo
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo NOME "Nome não pode ser vazio"

    @Teste
    Cenario: Validar status de erro para não envio de campo obrigatório EMAIL em cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir conjunto de dados para campo EMAIL nulo
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo EMAIL "E-mail não deve ser vazio"

    @Teste
    Cenario: Validar status de erro para não envio de campo obrigatório VALOR em cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir conjunto de dados para campo VALOR nulo
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo VALOR "Valor não pode ser vazio"

    @Teste
    Cenario: Validar status de erro para não envio de campo obrigatório PARCELA em cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir conjunto de dados para campo PARCELA nulo
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo PARCELA "Parcelas não pode ser vazio"

    @Teste
    Cenario: Validar status de erro para não envio de campo obrigatório SEGURO em cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir conjunto de dados para campo SEGURO nulo
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo SEGURO "Nome não pode ser vazio"

    #Regra: Texto informando o CPF // formato inválido 999.999.999-99
    @Teste
    Cenario: Validar formato de CPF informado para cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com CPF "999.999.999-99" em formato inválido
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo CPF "CPF inválido"

    #Regra: Texto informado um e-mail válido
    @Teste
    Esquema do Cenário: Validar formato de EMAIL informado para cadastro de nova simulação
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com EMAIL em formato inválido
        | EMAIL   |
        | <EMAIL> |
      E finalizar envio de informações
      Entao deve retornar statusCode 400
      E status de erro para campo EMAIL "E-mail deve ser um e-mail válido"
      Exemplos:
        | EMAIL       |
        | email.com   |
        | @email.com  |
        | email@email |

    #Regra: Valor da simulação que deve ser igual ou maior que R$ 1.000 e menor ou igual que R$ 40.000
    @Teste
    Cenario: Validar cadastro de simulação para campo "valor" menor que R$ 1.000
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com VALOR "999"
      E finalizar envio de informações
      Então deve retornar statusCode 400
      E status de erro para campo VALOR "Valor deve ser maior ou igual a R$ 1.000"

    @Teste
    Cenario: Validar cadastro de simulação para campo "valor" maior que R$ 40.000
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com VALOR "40001"
      E finalizar envio de informações
      Então deve retornar statusCode 400
      E status de erro para campo VALOR "Valor deve ser menor ou igual a R$ 40.000"

    @Teste
    Cenario: Validar cadastro de simulação para campo "valor" igual a R$ 1.000
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com VALOR "1000"
      E finalizar envio de informações
      Então deve retornar statusCode 201
      E informações cadastradas

    @Teste
    Cenario: Validar cadastro de simulação para campo "valor" igual a R$ 40.000
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com VALOR "40000"
      E finalizar envio de informações
      Então deve retornar statusCode 201
      E informações cadastradas

    #Regra: Número de parcelas para pagamento que deve ser igual ou maior que 2 e menor ou igual a 48
    @Teste
    Cenario: Validar cadastro de simulação para campo "parcela" menor que 2
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com PARCELA "1"
      E finalizar envio de informações
      Então deve retornar statusCode 400
      E status de erro para campo PARCELA "Parcelas deve ser igual ou maior que 2"

    @Teste
    Cenario: Validar cadastro de simulação para campo "parcela" maior que 48
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com PARCELA "49"
      E finalizar envio de informações
      Então deve retornar statusCode 400
      E status de erro para campo PARCELA "Parcelas deve ser igual ou menor que 48"

    Cenario: Validar cadastro de simulação para campo "parcela" igual a 2
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com PARCELA "2"
      E finalizar envio de informações
      Então deve retornar statusCode 201
      E informações cadastradas

    Cenario: Validar cadastro de simulação para campo "parcela" igual a R$ 48
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com PARCELA "48"
      E finalizar envio de informações
      Então deve retornar statusCode 201
      E informações cadastradas

    #Regra: Booleano true se com seguro e false se sem seguro
    @Teste
    Cenario: Validar cadastro de simulação para campo "seguro" diferente de true ou false
      Dado que preciso cadastrar uma nova simulação
      Quando inserir dados para cadastro de simulação com SEGURO "FALSO"
      E finalizar envio de informações
      Então deve retornar statusCode 400
#      E lista de erros

    #Regra: Erros para CPF já existente
    @Teste
    Cenario: Validar status de erro para tentativa de cadastro de nova simulação para CPF já cadastrado
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
     Quando inserir dados para cadastro de simulação com CPF já cadastrado
      E finalizar envio de informações
      Então deve retornar statusCode 409
      E status de erro para campo CPF "CPF já existente"
