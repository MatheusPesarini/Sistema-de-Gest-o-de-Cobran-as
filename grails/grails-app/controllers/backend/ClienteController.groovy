package backend

class ClienteController {

    AsaasIntegrationService asaasIntegrationService
    
    def index() { 
        [clienteList: Cliente.list(sort: "nome"), clienteCount: Cliente.count()]
    }
    
    def create() {
        [cliente: new Cliente()]
    }
    
    def save(Cliente cliente) {
        if (cliente.hasErrors()) {
            render view: "create", model: [cliente: cliente]
            return
        }
        
        def resultado = asaasIntegrationService.criarClienteNoAsaas(cliente)
        if (resultado.statusCode in 200..201) {
            cliente.asaasId = resultado.data.id
        }

        if (!cliente.save(flush: true)) {
            render view: 'create', model: [cliente: cliente]
            return
        }

        flash.message = "Cliente ${cliente.nome} cadastrado com sucesso!"
        redirect action: 'index'
    }
    
    def show(Long id) {
        def cliente = Cliente.get(id)
        if (!cliente) {
            flash.message = "Cliente não encontrado."
            redirect action: 'index'
            return
        }
        [cliente: cliente]
    }

    def edit(Long id) {
        def cliente = Cliente.get(id)
        if (!cliente) {
            flash.message = "Cliente não encontrado."
            redirect action: 'index'
            return
        }
        [cliente: cliente]
    }

    def update(Cliente cliente) {
        if (cliente.hasErrors()) {
            render view: 'edit', model: [cliente: cliente]
            return
        }
        if (!cliente.save(flush: true)) {
            render view: 'edit', model: [cliente: cliente]
            return
        }
        flash.message = "Cliente ${cliente.nome} atualizado com sucesso!"
        redirect action: 'show', id: cliente.id
    }
}
