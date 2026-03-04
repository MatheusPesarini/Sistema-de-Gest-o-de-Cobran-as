<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Painel</title>
</head>
<body>
<main id="content" role="main">
    <div class="text-center py-5">
        <h1 class="mb-3">Sistema de Cobrancas</h1>
        <p class="text-body-secondary mb-4">Painel interno para gerenciamento de clientes e cobrancas.</p>
        <div class="d-flex justify-content-center gap-2">
            <g:link controller="dashboard" action="index" class="btn btn-primary">Abrir Dashboard</g:link>
            <g:link controller="cliente" action="index" class="btn btn-outline-secondary">Clientes</g:link>
            <g:link controller="cobranca" action="index" class="btn btn-outline-secondary">Cobrancas</g:link>
        </div>
    </div>
</main>
</body>
</html>
