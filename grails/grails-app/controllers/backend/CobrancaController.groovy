package backend

class CobrancaController {

    AsaasIntegrationService asaasIntegrationService
    
    def index() {
        [cobrancaList: Cobranca.list(sort: 'dataVencimento', order: 'desc'), cobrancaCount: Cobranca.count()]
    }
    
    def create() {
        [cobranca: new Cobranca(), clientes: Cliente.list(sort: "nome")]
    }
    
    def save(Cobranca cobranca){
        if (cobranca.hasErrors()){
            render view: 'create', model: [cobranca: cobranca, clientes: Cliente.list()]
            return
        }
        
        def resultado = asaasIntegrationService.criarCobrancaNoAsaas(cobranca)
        
        if (resultado.statusCode in 200..201) {
            cobranca.asaasId = resultado.data.id
            cobranca.invoiceUrl = resultado.data.invoiceUrl
        }
        
        if (!cobranca.save(flush: true)){
            render view: 'create', model: [cobranca: cobranca, clientes: Cliente.list()]
            return
        }
        
        flash.message = "Cobrança gerada com sucesso!"
        redirect action: "index"
    }
    
    def atualizarStatus(Long id) {
        def cobranca = Cobranca.get(id)
        if (cobranca?.asaasId) {
            def resultado = asaasIntegrationService.consultarCobranca(cobranca.asaasId)
            if (resultado.statusCode == 200) {
                cobranca.status = resultado.data.status
                cobranca.save(flush: true)
            }
        }
        redirect action: "index"
    }

    def show(Long id) {
        def cobranca = Cobranca.get(id)
        if (!cobranca) {
            flash.message = "Cobrança não encontrada."
            redirect action: 'index'
            return
        }
        [cobranca: cobranca]
    }

    def edit(Long id) {
        def cobranca = Cobranca.get(id)
        if (!cobranca) {
            flash.message = "Cobrança não encontrada."
            redirect action: 'index'
            return
        }
        [cobranca: cobranca, clientes: Cliente.list(sort: "nome")]
    }

    def update(Cobranca cobranca) {
        if (cobranca.hasErrors()) {
            render view: 'edit', model: [cobranca: cobranca, clientes: Cliente.list(sort: "nome")]
            return
        }
        if (!cobranca.save(flush: true)) {
            render view: 'edit', model: [cobranca: cobranca, clientes: Cliente.list(sort: "nome")]
            return
        }
        flash.message = "Cobrança atualizada com sucesso!"
        redirect action: 'show', id: cobranca.id
    }
}
