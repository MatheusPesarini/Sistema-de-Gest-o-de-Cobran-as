package backend

class DashboardController {

    def index() {
        [
            totalPendente    : Cobranca.countByStatus('PENDENTE'),
            totalPaga        : Cobranca.countByStatus('PAGA'),
            totalCancelada   : Cobranca.countByStatus('CANCELADA'),
            totalVencida     : Cobranca.countByStatus('VENCIDA'),
            totalClientes    : Cliente.count(),
            totalWebhooks    : WebhookEvent.count(),
            ultimasCobrancas : Cobranca.list(max: 5, sort: 'dataVencimento', order: 'desc')
        ]
    }
}
