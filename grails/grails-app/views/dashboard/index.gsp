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
            <div class="col-md-3">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Pendentes</h5>
                        <p class="card-text display-6">${totalPendente}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Pagas</h5>
                        <p class="card-text display-6">${totalPaga}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-danger mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Canceladas</h5>
                        <p class="card-text display-6">${totalCancelada}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Total de Clientes</h5>
                        <p class="card-text display-6">${totalClientes}</p>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="mt-4">Últimas Cobranças</h2>
        <table class="table table-striped table-sm">
            <thead>
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
                    <td>${c.status}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="mt-3">
            <g:link controller="cliente" action="index" class="btn btn-primary">Ver Clientes</g:link>
            <g:link controller="cobranca" action="index" class="btn btn-secondary ms-2">Ver Cobranças</g:link>
        </div>

    </div>
</div>
</body>
</html>
