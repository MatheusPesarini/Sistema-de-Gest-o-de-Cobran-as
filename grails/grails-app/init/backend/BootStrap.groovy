package backend

import grails.gorm.transactions.Transactional

class BootStrap {

    def init = {
        criarUsuarioAdmin()
    }

    def destroy = {
    }

    @Transactional
    void criarUsuarioAdmin() {
        // Cria a role ROLE_ADMIN se não existir
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)

        // Verifica se o admin já existe
        def adminUser = User.findByUsername('admin')

        if (adminUser) {
            // Se a senha não começa com {bcrypt}, está em texto puro — recria
            if (!adminUser.password?.startsWith('{bcrypt}')) {
                println "⚠️ [BOOTSTRAP] Senha do admin não está codificada. Recriando..."
                UserRole.removeAll(adminUser)
                adminUser.delete(flush: true)
                adminUser = null
            }
        }

        if (!adminUser) {
            adminUser = new User(
                username: 'admin',
                password: 'admin123',
                enabled: true,
                accountExpired: false,
                accountLocked: false,
                passwordExpired: false
            ).save(flush: true)

            // Associa o usuário à role
            UserRole.create(adminUser, adminRole, true)

            println "✅ [BOOTSTRAP] Usuário admin criado com sucesso! (login: admin / senha: admin123)"
        }
    }
}
