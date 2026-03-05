<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
</head>
<body>
<div id="content" role="main">
    <div class="container">

        <h1>Painel de Controle</h1>

        <div class="row mt-4">
            <div class="col-md-4 col-lg-2">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body text-center">
                        <i class="bi bi-clock-history fs-3"></i>
                        <h6 class="card-title mt-1">Pendentes</h6>
                        <p class="card-text display-6 fw-bold">${totalPendente}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body text-center">
                        <i class="bi bi-check-circle fs-3"></i>
                        <h6 class="card-title mt-1">Pagas</h6>
                        <p class="card-text display-6 fw-bold">${totalPaga}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <div class="card text-white bg-danger mb-3">
                    <div class="card-body text-center">
                        <i class="bi bi-x-circle fs-3"></i>
                        <h6 class="card-title mt-1">Canceladas</h6>
                        <p class="card-text display-6 fw-bold">${totalCancelada}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <div class="card text-white bg-dark mb-3">
                    <div class="card-body text-center">
                        <i class="bi bi-exclamation-triangle fs-3"></i>
                        <h6 class="card-title mt-1">Vencidas</h6>
                        <p class="card-text display-6 fw-bold">${totalVencida}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body text-center">
                        <i class="bi bi-people fs-3"></i>
                        <h6 class="card-title mt-1">Clientes</h6>
                        <p class="card-text display-6 fw-bold">${totalClientes}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <div class="card text-white bg-info mb-3">
                    <div class="card-body text-center">
                        <i class="bi bi-broadcast fs-3"></i>
                        <h6 class="card-title mt-1">Webhooks</h6>
                        <p class="card-text display-6 fw-bold">${totalWebhooks}</p>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="mt-4"><i class="bi bi-receipt"></i> Últimas Cobranças</h2>
        <div class="card">
            <div class="card-body p-0">
                <table class="table table-striped table-hover mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>Cliente</th>
                        <th>Valor</th>
                        <th>Vencimento</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ultimasCobrancas}" var="c">
                        <tr>
                            <td>${c.cliente?.nome}</td>
                            <td>R$ ${c.valor}</td>
                            <td><g:formatDate date="${c.dataVencimento}" format="dd/MM/yyyy"/></td>
                            <td>
                                <g:if test="${c.status == 'PAGA'}">
                                    <span class="badge bg-success">${c.status}</span>
                                </g:if>
                                <g:elseif test="${c.status == 'PENDENTE'}">
                                    <span class="badge bg-warning text-dark">${c.status}</span>
                                </g:elseif>
                                <g:elseif test="${c.status == 'VENCIDA'}">
                                    <span class="badge bg-dark">${c.status}</span>
                                </g:elseif>
                                <g:else>
                                    <span class="badge bg-danger">${c.status}</span>
                                </g:else>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="mt-3">
            <g:link controller="cliente" action="index" class="btn btn-primary">
                <i class="bi bi-people"></i> Ver Clientes
            </g:link>
            <g:link controller="cobranca" action="index" class="btn btn-secondary ms-2">
                <i class="bi bi-receipt"></i> Ver Cobranças
            </g:link>
            <g:link controller="webhook" action="index" class="btn btn-info ms-2 text-white">
                <i class="bi bi-broadcast"></i> Ver Webhooks
            </g:link>
        </div>

    </div>
</div>
</body>
</html>
