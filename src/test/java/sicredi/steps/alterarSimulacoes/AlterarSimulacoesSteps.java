package sicredi.steps.alterarSimulacoes;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Então;
import io.cucumber.java.pt.Quando;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import sicredi.utils.GeradorDeDados;

import java.util.Map;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static sicredi.steps.cadastrarSimulacoes.CadastrarSimulacoesSteps.*;

public class AlterarSimulacoesSteps {
    Response response;
    RequestSpecification request;
    GeradorDeDados geradorDeDados;

    @Dado("^que informo atualização para simulação com CPF não encontrado$")
    public void queInformoAtualizacaoParaSimulacaoComCPFNaoEncontrado() throws Exception {
        request = RestAssured.given()
                .log()
                .all()
                .accept("application/json")
                .contentType(ContentType.JSON);

        geradorDeDados = new GeradorDeDados();
        cpfAux = geradorDeDados.getCpf();
    }

    @Quando("^preciso atualizar o cadastro de uma simulação para CPF informado$")
    public void precisoAtualizarOCadastroDeUmaSimulacaoParaCPFInformado() throws Exception {
        request = RestAssured.given()
                .log()
                .all()
                .accept("application/json")
                .contentType(ContentType.JSON);
    }

    @Então("^deve retornar status (.*)$")
    public void deveRetornarStatusCode(int statusCode) {
        response.then().log().all()
                .statusCode(statusCode);
    }

    @E("^inserir dados a serem atualizados para NOME \"(.*)\"$")
    public void inserirDadosASeremAtualizadosParaNOME(String nomeParameter) throws Exception {
        nomeCompleto = nomeParameter;
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para CPF formato \"(.*)\"$")
    public void inserirDadosASeremAtualizadosParaCPFFormato(String cpfParameter) throws Exception {
        cpf = cpfParameter;
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para CPF$")
    public void inserirDadosASeremAtualizadosParaCPF() throws Exception {
        geradorDeDados = new GeradorDeDados();
        cpf = geradorDeDados.getCpf();
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para CPF não existente$")
    public void inserirDadosASeremAtualizadosParaCPFnaoExistente() throws Exception {
        geradorDeDados = new GeradorDeDados();
        cpfAux = geradorDeDados.getCpf();
        seguro = true;

        request.body(
                "{\n" +
                        "  \"nome\": \"" + geradorDeDados.getNomeCompleto() + "\",\n" +
                        "  \"cpf\": \"" + cpfAux + "\",\n" +
                        "  \"email\": \"" + geradorDeDados.getEmail() + "\",\n" +
                        "  \"valor\": " + geradorDeDados.getValor() + ",\n" +
                        "  \"parcelas\": " + geradorDeDados.getParcela() + ",\n" +
                        "  \"seguro\": " + seguro + "\n" +
                        "}").log().all();
    }

    @E("^inserir dados a serem atualizados para EMAIL \"(.*)\"$")
    public void inserirDadosASeremAtualizadosParaEMAIL(String emailParameter) throws Exception {
        email = emailParameter;
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para VALOR$")
    public void inserirDadosASeremAtualizadosParaVALOR() throws Exception {
        geradorDeDados = new GeradorDeDados();
        valor = geradorDeDados.getValor();
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para VALOR \"(.*)\"$")
    public void inserirDadosASeremAtualizadosParaVALOREspecificado(int valorParameter) throws Exception {
        valor = valorParameter;
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para PARCELAS$")
    public void inserirDadosASeremAtualizadosParaPARCELAS() throws Exception {
        geradorDeDados = new GeradorDeDados();
        parcelas = geradorDeDados.getParcela();
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para PARCELA \"(.*)\"$")
    public void inserirDadosASeremAtualizadosParaPARCELA(Integer parcelaParameter) throws Exception {
        parcelas = parcelaParameter;
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para SEGURO \"(.*)\"$")
    public void inserirDadosASeremAtualizadosParaSEGURO(Boolean seguroParameter) throws Exception {
        seguro = seguroParameter;
        cadastrar();
    }

    @E("^inserir dados a serem atualizados para EMAIL em formato invalido$")
    public void inserirDadosASeremAtualizadosParaEmailEmFormatoInvalido(DataTable table) throws Exception {
        for (Map<Object, Object> data : table.asMaps(String.class, String.class)) {
            email = (String) data.get("EMAIL");

            request.body(
                    "{\n" +
                            "  \"nome\": \"" + nomeCompleto + "\",\n" +
                            "  \"cpf\": \"" + cpf + "\",\n" +
                            "  \"email\": \"" + email + "\",\n" +
                            "  \"valor\": " + valor + ",\n" +
                            "  \"parcelas\": " + parcelas + ",\n" +
                            "  \"seguro\": " + seguro + "\n" +
                            "}").log().all();
        }
    }

    @E("finalizar alteracões de informações")
    public void finalizaralteracõesDeInformações() {
        response = request.when().log().all()
                .put("/api/v1/simulacoes/" + cpfAux);
    }

    @E("informações alteradas")
    public void informaçõesAlteradas() {
        response.then().log().all()
                .body("id", notNullValue())
                .body("nome", is(nomeCompleto))
                .body("cpf", is(cpf))
                .body("email", is(email))
                .body("valor", is(Float.valueOf(valor)))
                .body("parcelas", is(parcelas))
                .body("seguro", is(seguro));
    }

    @E("informação de erro para CPF")
    public void informaçãoDeErro() {
        response.then().log().all()
                .body("mensagem", is("CPF " + cpfAux + " não encontrado"));
    }

    @E("^status de erro para EMAIL \"(.*)\"$")
    public void statusDeErroEmail(String mensagem) {
        response.then().log().all()
                .body("erros.email", is(mensagem));
    }

    @E("^status de erro \"(.*)\"$")
    public void statusDeErro(String mensagem) {
        response.then().log().all()
                .body("mensagem", is(mensagem));
    }

    public void cadastrar() throws Exception {
        request.body(
                "{\n" +
                        "  \"nome\": \"" + nomeCompleto + "\",\n" +
                        "  \"cpf\": \"" + cpf + "\",\n" +
                        "  \"email\": \"" + email + "\",\n" +
                        "  \"valor\": " + valor + ",\n" +
                        "  \"parcelas\": " + parcelas + ",\n" +
                        "  \"seguro\": " + seguro + "\n" +
                        "}").log().all();
    }
}
