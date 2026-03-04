<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Cobranças</title>
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
                    <li class="nav-item me-lg-auto">
                        <g:link class="nav-link btn btn-primary btn-sm text-white" action="create">
                            <i class="bi-receipt"></i> Nova Cobrança
                        </g:link>
                    </li>
                </ul>
            </nav>
        </section>

        <section class="row">
            <div class="col-12">
                <h3><i class="bi-receipt"></i> Cobranças</h3>

                <g:if test="${flash.message}">
                    <div class="alert alert-success"><i class="bi-check-circle"></i> ${flash.message}</div>
                </g:if>

                <g:if test="${cobrancaList}">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-sm align-middle">
                            <thead class="table-dark">
                            <tr>
                                <th>Cliente</th>
                                <th>Descrição</th>
                                <th>Valor</th>
                                <th>Vencimento</th>
                                <th>Status</th>
                                <th class="text-center">Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${cobrancaList}" var="cob">
                                <tr>
                                    <td>${cob.cliente?.nome}</td>
                                    <td>${cob.descricao ?: '-'}</td>
                                    <td>R$ <g:formatNumber number="${cob.valor}" format="0.00"/></td>
                                    <td><g:formatDate date="${cob.dataVencimento}" format="dd/MM/yyyy"/></td>
                                    <td>
                                        <g:set var="badgeClass" value="${cob.status == 'PAGA' ? 'bg-success' : cob.status == 'CANCELADA' ? 'bg-danger' : 'bg-warning text-dark'}"/>
                                        <span class="badge ${badgeClass}">${cob.status}</span>
                                    </td>
                                    <td class="text-center">
                                        <g:link action="show" id="${cob.id}" class="btn btn-sm btn-outline-primary">
                                            <i class="bi-eye"></i> Ver
                                        </g:link>
                                        <g:link action="atualizarStatus" id="${cob.id}" class="btn btn-sm btn-outline-secondary">
                                            <i class="bi-arrow-repeat"></i> Sincronizar
                                        </g:link>
                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </g:if>
                <g:else>
                    <div class="alert alert-info">
                        <i class="bi-info-circle"></i> Nenhuma cobrança cadastrada ainda.
                        <g:link action="create" class="alert-link">Gerar a primeira cobrança</g:link>.
                    </div>
                </g:else>

                <g:if test="${cobrancaCount > params.int('max', 10)}">
                    <div class="mt-3">
                        <g:paginate total="${cobrancaCount}"/>
                    </div>
                </g:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>
