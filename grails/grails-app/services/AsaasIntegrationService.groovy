package backend

import grails.gorm.transactions.Transactional
import groovy.json.JsonOutput
import groovy.json.JsonSlurper
import org.springframework.beans.factory.annotation.Value

import java.text.SimpleDateFormat

@Transactional
class AsaasIntegrationService {

    private final String apiKey = System.getenv("ASAAS_API_KEY") ?: ""
    private static final String BASE_URL = 'https://sandbox.asaas.com/api/v3'

    Map criarClienteNoAsaas(Cliente cliente) {
        def payload = [
            name       : cliente.nome,
            cpfCnpj    : cliente.cpfCnpj?.replaceAll("[^0-9]", ""),
            email      : cliente.email,
            mobilePhone: cliente.telefone
        ]
        return post("/customers", payload)
    }

    Map criarCobrancaNoAsaas(Cobranca cobranca) {
        def formatador = new SimpleDateFormat("yyyy-MM-dd")
        def dataFormatada = formatador.format(cobranca.dataVencimento)        
        
        def payload = [
            customer   : cobranca.cliente.asaasId,
            billingType: "BOLETO",
            value      : cobranca.valor,
            dueDate    : dataFormatada,
            description: cobranca.descricao ?: ""
        ]
        return post("/payments", payload)
    }

    Map consultarCobranca(String asaasId) {
        return get("/payments/${asaasId}")
    }

    private Map post(String path, Map body) {
        def url = new URL("${BASE_URL}${path}")
        def connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "POST"
        connection.setRequestProperty("Content-Type", "application/json")
        connection.setRequestProperty("access_token", apiKey)
        connection.setRequestProperty("User-Agent", "MiniAsaas/1.0")
        connection.doOutput = true
        connection.outputStream.withWriter("UTF-8") { it << JsonOutput.toJson(body) }
        return parseResponse(connection)
    }

    private Map get(String path) {
        def url = new URL("${BASE_URL}${path}")
        def connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.setRequestProperty("access_token", apiKey)
        connection.setRequestProperty("User-Agent", "MiniAsaas/1.0")
        return parseResponse(connection)
    }

    private Map parseResponse(HttpURLConnection connection) {
        def code = connection.responseCode
        def stream = (code >= 200 && code < 300) ? connection.inputStream : connection.errorStream

//        if (!stream) {
//            println "🚨 [ASAAS API] Retornou sem corpo. StatusCode: ${code}"
//            return [statusCode: code, data: null]
//        }

        def json = new JsonSlurper().parse(stream, "UTF-8")

        // --- ADICIONE ESTAS DUAS LINHAS AQUI ---
        println "👉 [ASAAS API] Código HTTP retornado: ${code}"
        println "👉 [ASAAS API] Resposta do Asaas: ${json}"
        // ----------------------------------------
        return [statusCode: code, data: json]
    }
}
