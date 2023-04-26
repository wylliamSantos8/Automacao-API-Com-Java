#language:pt
Funcionalidade: Alterar Simulacões de acordo com parâmetros informados

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenário: Deve atualizar uma simulação existente através do CPF para campo NOME
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para NOME "Fulano de Freitas"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenario: Deve atualizar uma simulação existente através do CPF para campo CPF
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para CPF
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenario: Deve atualizar uma simulação existente através do CPF para campo EMAIL
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para EMAIL "teste@gmail.com"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenario: Deve atualizar uma simulação existente através do CPF para campo VALOR
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para VALOR
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenario: Deve atualizar uma simulação existente através do CPF para campo PARCELAS
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para PARCELAS
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Deve retornar HTTP Status 200
    @Teste
    Cenario: Deve atualizar uma simulação existente através do CPF para campo SEGURO
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para SEGURO "false"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Deve retornar HTTP Status 404
    @Teste
    Cenario: Deve retornar status de erro para simulação não encontrada
      Dado preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para CPF não existente
      Quando finalizar alteracões de informações
      Então deve retornar status 404
      E informação de erro para CPF

    #Regra: Texto informando o CPF // formato inválido 999.999.999-99
    @Teste
    Cenario: Validar formato de CPF informado para atualização de simulação
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para CPF formato "999.999.999-99"
      E finalizar alteracões de informações
      Então deve retornar status 400

    #Regra: Texto informado um e-mail válido
    @Teste
    Esquema do Cenario: Validar formato de EMAIL informado para atualização de simulação
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para EMAIL em formato invalido
        | EMAIL   |
        | <EMAIL> |
      E finalizar alteracões de informações
      Entao deve retornar status 400
      E status de erro para EMAIL "não é um endereço de e-mail"
      Exemplos:
        | EMAIL       |
        | email.com   |
        | @email.com  |
        | email@email |

    #Regra: Valor da simulação que deve ser igual ou maior que R$ 1.000 e menor ou igual que R$ 40.000
    @Teste
    Cenario: Validar atualização de simulação para campo "valor" menor que R$ 1.000
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para VALOR "999"
      E finalizar alteracões de informações
      Então deve retornar status 400

    @Teste
    Cenario: Validar atualização de simulação para campo "valor" maior que R$ 40.000
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para VALOR "40001"
      E finalizar alteracões de informações
      Então deve retornar statusCode 400

    @Teste
    Cenario: Validar atualização de simulação para campo "valor" igual a R$ 1.000
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para VALOR "1000"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    @Teste
    Cenario: Validar atualização de simulação para campo "valor" igual a R$ 40.000
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para VALOR "40000"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Número de parcelas para pagamento que deve ser igual ou maior que 2 e menor ou igual a 48
    @Teste
    Cenario: Validar atualização de simulação para campo "parcela" menor que 2
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para PARCELA "1"
      E finalizar alteracões de informações
      Então deve retornar status 400

    @Teste
    Cenario: Validar atualização de simulação para campo "parcela" maior que 48
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para PARCELA "49"
      E finalizar alteracões de informações
      Então deve retornar status 400

    @Teste
    Cenario: Validar atualização de simulação para campo "parcela" igual a 2
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para PARCELA "2"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    @Teste
    Cenario: Validar atualização de simulação para campo "parcela" igual a R$ 48
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para PARCELA "48"
      E finalizar alteracões de informações
      Então deve retornar status 200
      E informações alteradas

    #Regra: Booleano true se com seguro e false se sem seguro
    @Teste
    Cenario: Validar atualização de simulação para campo "seguro" diferente de true ou false
      Dado que preciso cadastrar uma nova simulação
      E inserir dados corretos para cadastro de simulação
      E finalizar envio de informações
      E deve retornar statusCode 201
      E informações cadastradas
      Quando preciso atualizar o cadastro de uma simulação para CPF informado
      E inserir dados a serem atualizados para SEGURO "falso"
      E finalizar alteracões de informações
      Então deve retornar status 400

    #Regra: Se o CPF não possuir uma simulação o HTTP Status 404 é retornado com a mensagem "CPF não encontrado"
    @Teste
    Cenario: Validar status de erro para alteração em simulação com CPF não encontrado
      Dado que informo atualização para simulação com CPF não encontrado
      Quando finalizar alteracões de informações
      Então deve retornar status 404
      E status de erro "CPF não encontrado"
