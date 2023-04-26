package sicredi.steps.removerSimulacoes;

import com.github.javafaker.Faker;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Então;
import io.cucumber.java.pt.Quando;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import sicredi.steps.consultarSimulacoes.ConsultarSimulacoesSteps;

import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;
import static sicredi.steps.cadastrarSimulacoes.CadastrarSimulacoesSteps.id;

public class RemoverSimulacoesSteps {
    Response response;
    RequestSpecification request;


    @Dado("^insiro parâmetros para remoção de simulação para ID não cadastrada$")
    public void insiroParametrosParaRemocaoDeSimulacaoParaIDNaoCadastrada() {
        request = RestAssured.given().log().all();
        Faker faker = new Faker();
        id = faker.number().numberBetween(9999,9999999);
    }

    @Quando("^inserir parâmetros para remoção de simulação para ID informado$")
    public void inserirParametrosParaRemocaoDesimulacaoParaIDInformado() {
        request = RestAssured.given().log().all();
    }

    @E("finalizar envio de informações para remoção")
    public void finalizarEnvioDeInformaçõesParaRemoção() {
        response = request.when().log().all()
                .delete("/api/v1/simulacoes/" + id);
    }

    @Então(("^deve exibir statusCode (.*)"))
    public void entaoDeveExibirStatus(int statusCode) {
        response.then().log().all()
                .statusCode(statusCode);
    }

    @E("que removo todos os registros informados em lista")
    public void removoTodosOsRegistrosInformadosEmLista() {
        String body;

        do {
            //Consultar simulações
            request = RestAssured.given().log().all();
            response = request.when().log().all().get("/api/v1/simulacoes");
            response.then().log().all();
            body = response.body().asString();
            if (body.contains("id")){
                id = response.path("id[0]");
                //Apagar
                request = RestAssured.given().log().all();
                response = request.when().log().all().delete("/api/v1/simulacoes/" + id);
                response.then().log().all();
            }
        } while (body.contains("id"));
    }
}
