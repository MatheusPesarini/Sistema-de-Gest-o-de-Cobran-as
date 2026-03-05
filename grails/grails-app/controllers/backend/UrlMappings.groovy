package backend

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'dashboard', action: 'index')

        // Webhook do Asaas - aceita POST
        "/webhook/asaas"(controller: 'webhook', action: 'receberNotificacao', method: 'POST')

        // Login/Logout do Spring Security
        "/login/auth"(controller: 'login', action: 'auth')
        "/login/denied"(controller: 'login', action: 'denied')
        "/login/authfail"(controller: 'login', action: 'authfail')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
