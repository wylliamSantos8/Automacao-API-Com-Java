package sicredi.runners;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        monochrome = true,
        glue = {"sicredi.steps.cadastrarSimulacoes"},
        plugin = "html:target/reports/sicredi-cadastrarSimulacoes.html",
        features ="classpath:features/cadastrarSimulacoes.feature",
        tags = "@Teste",
        snippets = CucumberOptions.SnippetType.CAMELCASE
)
public class CadastrarSimulacoesTests {
}
