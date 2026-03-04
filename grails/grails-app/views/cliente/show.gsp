<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes do Cliente</title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row mb-3">
            <nav class="navbar navbar-expand-lg bg-body-tertiary rounded">
                <ul class="navbar-nav container-fluid">
                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(uri: '/')}"><i class="bi-house"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" action="index"><i class="bi-people"></i> Clientes</g:link>
                    </li>
                    <li class="nav-item me-lg-auto">
                        <g:link class="nav-link" action="create"><i class="bi-person-plus"></i> Novo Cliente</g:link>
                    </li>
                </ul>
            </nav>
        </section>

        <section class="row justify-content-center">
            <div class="col-md-8">

                <g:if test="${flash.message}">
                    <div class="alert alert-success"><i class="bi-check-circle"></i> ${flash.message}</div>
                </g:if>

                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="bi-person"></i> ${cliente.nome}</h4>
                        <span class="badge bg-secondary">#${cliente.id}</span>
                    </div>
                    <div class="card-body">
                        <dl class="row">
                            <dt class="col-sm-3">CPF / CNPJ</dt>
                            <dd class="col-sm-9">${cliente.cpfCnpj}</dd>

                            <dt class="col-sm-3">E-mail</dt>
                            <dd class="col-sm-9">${cliente.email}</dd>

                            <dt class="col-sm-3">Telefone</dt>
                            <dd class="col-sm-9">${cliente.telefone ?: '-'}</dd>

                            <dt class="col-sm-3">ID Asaas</dt>
                            <dd class="col-sm-9">${cliente.asaasId ?: '<span class="text-muted">Não sincronizado</span>'}</dd>
                        </dl>
                    </div>
                    <div class="card-footer d-flex gap-2">
                        <g:link action="edit" id="${cliente.id}" class="btn btn-outline-primary">
                            <i class="bi-pencil"></i> Editar
                        </g:link>
                        <g:link controller="cobranca" action="create" params="[clienteId: cliente.id]" class="btn btn-success">
                            <i class="bi-receipt"></i> Nova Cobrança
                        </g:link>
                    </div>
                </div>

                <g:if test="${cliente.cobrancas}">
                    <h5 class="mt-4"><i class="bi-receipt"></i> Cobranças deste cliente</h5>
                    <table class="table table-sm table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>Descrição</th>
                            <th>Valor</th>
                            <th>Vencimento</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${cliente.cobrancas}" var="cob">
                            <tr>
                                <td>${cob.descricao ?: '-'}</td>
                                <td>R$ <g:formatNumber number="${cob.valor}" format="0.00"/></td>
                                <td><g:formatDate date="${cob.dataVencimento}" format="dd/MM/yyyy"/></td>
                                <td>
                                    <g:set var="badgeClass" value="${cob.status == 'PAGA' ? 'bg-success' : cob.status == 'CANCELADA' ? 'bg-danger' : 'bg-warning text-dark'}"/>
                                    <span class="badge ${badgeClass}">${cob.status}</span>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </g:if>

            </div>
        </section>
    </div>
</div>
</body>
</html>
