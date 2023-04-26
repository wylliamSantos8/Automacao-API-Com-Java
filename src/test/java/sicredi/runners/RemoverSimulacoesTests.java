package sicredi.runners;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        monochrome = true,
        glue = {"sicredi.steps.removerSimulacoes", "sicredi.steps.cadastrarSimulacoes", "sicredi.steps.consultarSimulacoes"},
        plugin = {"pretty","html:target/reports/sicredi-removerSimulacoes.html"},
        features ="classpath:features/removerSimulacoes.feature",
        tags = "@Teste",
        snippets = CucumberOptions.SnippetType.CAMELCASE
)
public class RemoverSimulacoesTests {
}
