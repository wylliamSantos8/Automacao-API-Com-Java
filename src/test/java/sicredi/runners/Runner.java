package sicredi.runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features ="src/test/resources/features/",
        monochrome = true,
        glue = {"sicredi.steps"},
        plugin = "html:target/reports/sicredi-consultarRestricoes.html",
        tags = "@Teste",
        snippets = CucumberOptions.SnippetType.CAMELCASE,
        dryRun = false
)

public class Runner {}
