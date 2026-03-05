package backend

class WebhookEvent {

    String evento
    String asaasPaymentId
    String payloadJson
    Date dateCreated

    static constraints = {
        evento blank: false
        asaasPaymentId nullable: true
        payloadJson nullable: true, maxSize: 10000
    }

    static mapping = {
        payloadJson type: 'text'
        autoTimestamp true
    }
}

