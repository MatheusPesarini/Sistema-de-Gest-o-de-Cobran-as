package backend

class Cobranca {
    
    BigDecimal valor
    Date dataVencimento
    String descricao
    String status = "PENDENTE"
    String asaasId
    String invoiceUrl
    
    static belongsTo = [cliente: Cliente]

    static constraints = {
        valor nullable: false, min: 0.01G
        dataVencimento nullable: false
        descricao nullable: true
        status inList: ["PENDENTE", "PAGA", "CANCELADA"]
        asaasId nullable: true, unique: true
        invoiceUrl nullable: true
    }
}
