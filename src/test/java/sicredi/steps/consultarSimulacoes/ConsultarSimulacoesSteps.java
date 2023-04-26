package sicredi.steps.consultarSimulacoes;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Então;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import sicredi.utils.GeradorDeDados;

import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.is;
import static sicredi.steps.cadastrarSimulacoes.CadastrarSimulacoesSteps.*;

public class ConsultarSimulacoesSteps {
    Response response;
    RequestSpecification request;
    GeradorDeDados geradorDeDados;

    @Dado("^inicio de consulta para CPF não cadastrado$")
    public void inicioDeConsultaParaCPFNaoCadastrado() throws Exception {
        geradorDeDados = new GeradorDeDados();
        cpf = geradorDeDados.getCpf();
        request = RestAssured.given().log().all();
    }

    @Então("^inicio de consulta por simulações existentes$")
    public void inicioDeConsultaPorSimulacoesExistentes() {
        request = RestAssured.given().log().all();
    }

    @Então("^inicio nova consulta por simulações existentes$")
    public void inicioNovaDeConsultaPorSimulacoesExistentes() {
        request = RestAssured.given().log().all();
    }

    @Então("^inicio de consulta por simulações para CPF informado$")
    public void inicioDeConsultaPorSimulacoesParaCPFInformado() {
        request = RestAssured.given().log().all();
    }

    @E("finalizar envio de informações para consulta")
    public void finalizarEnvioDeInformaçõesParaConsulta() {
        response = request.when().log().all()
                .get("/api/v1/simulacoes");
    }

    @E("finalizar envio de informações para consulta por CPF")
    public void finalizarEnvioDeInformaçõesParaConsultaPorCPF() {
        response = request.when().log().all()
                .get("/api/v1/simulacoes/" + cpf);
    }

    @Então("^deve retornar status (.*)$")
    public void deveRetornarStatusCode(int statusCode) {
        response.then().log().all()
                .statusCode(statusCode);
    }

    @E("lista contendo dados de operações")
    public void listaContendoDadosDeOperacoes() {
        response.then().log().all()
                .body("id", hasItem(id));
    }

    @E("^mensagem de erro$")
    public void mensagemDeErro() {
        response.then().log().all()
                .body("mensagem", is("CPF " + cpf + " não encontrado"));
    }
}
