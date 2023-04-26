package sicredi.runners;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        monochrome = true,
        glue = {"sicredi.steps.consultarSimulacoes", "sicredi.steps.cadastrarSimulacoes", "sicredi.steps.removerSimulacoes"},
        plugin = "html:target/reports/sicredi-consultarSimulacoes.html",
        features ="classpath:features/consultarSimulacoes.feature",
        tags = "@Teste",
        snippets = CucumberOptions.SnippetType.CAMELCASE
)
public class ConsultarSimulacoesTests {
}
