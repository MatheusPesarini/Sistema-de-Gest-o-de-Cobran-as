package backend

class DashboardController {

    def index() {
        [
            totalPendente   : Cobranca.countByStatus('PENDENTE'),
            totalPaga       : Cobranca.countByStatus('PAGA'),
            totalCancelada  : Cobranca.countByStatus('CANCELADA'),
            totalClientes   : Cliente.count(),
            ultimasCobrancas: Cobranca.list(max: 5, sort: 'dataVencimento', order: 'desc')
        ]
    }
}
