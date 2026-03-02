package backend

class Cliente {

    String nome
    String cpfCnpj
    String email
    String telefone
    String asaasId
    
    static hasMany = [cobrancas: Cobranca]
    
    static constraints = {
        nome blank: false
        cpfCnpj blank: false, unique: true
        email blank: false, email: true, unique: true
        telefone nullable: true
        asaasId nullable: true, unique: true
    }
}
