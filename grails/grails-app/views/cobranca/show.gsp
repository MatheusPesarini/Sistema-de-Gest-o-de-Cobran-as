<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes da Cobrança</title>
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
                        <g:link class="nav-link" action="index"><i class="bi-receipt"></i> Cobranças</g:link>
                    </li>
                    <li class="nav-item me-lg-auto">
                        <g:link class="nav-link" action="create"><i class="bi-receipt"></i> Nova Cobrança</g:link>
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
                        <h4 class="mb-0"><i class="bi-receipt"></i> Cobrança #${cobranca.id}</h4>
                        <g:set var="badgeClass" value="${cobranca.status == 'PAGA' ? 'bg-success' : cobranca.status == 'CANCELADA' ? 'bg-danger' : 'bg-warning text-dark'}"/>
                        <span class="badge ${badgeClass} fs-6">${cobranca.status}</span>
                    </div>
                    <div class="card-body">
                        <dl class="row">
                            <dt class="col-sm-4">Cliente</dt>
                            <dd class="col-sm-8">
                                <g:link controller="cliente" action="show" id="${cobranca.cliente?.id}">
                                    ${cobranca.cliente?.nome}
                                </g:link>
                            </dd>

                            <dt class="col-sm-4">Descrição</dt>
                            <dd class="col-sm-8">${cobranca.descricao ?: '-'}</dd>

                            <dt class="col-sm-4">Valor</dt>
                            <dd class="col-sm-8">R$ <g:formatNumber number="${cobranca.valor}" format="0.00"/></dd>

                            <dt class="col-sm-4">Vencimento</dt>
                            <dd class="col-sm-8"><g:formatDate date="${cobranca.dataVencimento}" format="dd/MM/yyyy"/></dd>

                            <dt class="col-sm-4">ID Asaas</dt>
                            <dd class="col-sm-8">${cobranca.asaasId ?: '<span class="text-muted">Não sincronizado</span>'}</dd>

                            <g:if test="${cobranca.invoiceUrl}">
                                <dt class="col-sm-4">Link de Pagamento</dt>
                                <dd class="col-sm-8">
                                    <a href="${cobranca.invoiceUrl}" target="_blank" class="btn btn-sm btn-success">
                                        <i class="bi-box-arrow-up-right"></i> Abrir Boleto / Pix
                                    </a>
                                </dd>
                            </g:if>
                        </dl>
                    </div>
                    <div class="card-footer d-flex gap-2">
                        <g:link action="atualizarStatus" id="${cobranca.id}" class="btn btn-outline-secondary">
                            <i class="bi-arrow-repeat"></i> Sincronizar Status
                        </g:link>
                        <g:link action="edit" id="${cobranca.id}" class="btn btn-outline-primary">
                            <i class="bi-pencil"></i> Editar
                        </g:link>
                    </div>
                </div>

            </div>
        </section>
    </div>
</div>
</body>
</html>
