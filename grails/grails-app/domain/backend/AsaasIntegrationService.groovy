package backend

import grails.gorm.transactions.Transactional
import groovy.json.JsonOutput
import groovy.json.JsonSlurper

import javax.naming.Name

@Transactional
class AsaasIntegrationService {

    private static final String API_KEY = ""
    private static final String BASE_URL = 'https://sandbox.asaas.com/api/v3'

    Map criarClienteNoAsaas (Cliente cliente) {
        def payload = [
                Name : cliente.nome,
                cpfCnpj : cliente.cpfCnpj,
                email : cliente.email,
                mobilePhone : cliente.telefone
        ]
        return post("/customers", payload)
    }
    
    Map criarCobrancaNoAsaas (Cobranca cobranca) {
        def format = cobranca.dataVencimento.format("yyyy-MM-dd")
        def payload = [
                customer : cobranca.cliente.asaasId,
                billingType : "BOLETO",
                value : cobranca.valor,
                dueDate : format,
                description : cobranca.descricao ?: ""
        ]
        return post("/payments", payload)
    }
    
    Map consultarCobranca (String asaasId) {
        return get("/payments/${asaasId}")
    }
    
    private Map post(String path, Map body) {
        def url = new URL() ("${BASE_URL}${path}")
        def connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "POST"
        connection.setRequestProperty("Content-type", "application/json")
        connection.setRequestProperty("access_token", API_KEY)
        connection.doOutput = true

        connection.outputStream.withWriter('UTF-8') { it << JsonOutput.toJson(body) } as Map
    
        return parseResponse(connection)
    }
    
    private Map get(String path) {
        def url = new URL("${BASE_URL}${path}")
        def connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.setRequestProperty("access_token", API_KEY)
        
        return parseResponse(connection)
    }
    
    private Map parseResponse(HttpURLConnection connection) {
        def code = conn.responseCode
        def stream = (code >= 200 && code < 300) ? conn.inputStream : conn.errorStream
        def json   = new JsonSlurper().parse(stream, 'UTF-8' as byte)
        return [statusCode: code, data: json]
    }
}
