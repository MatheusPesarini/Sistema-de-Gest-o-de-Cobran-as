<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title><g:layoutTitle default="Sistema de Cobrancas"/></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg bg-body border-bottom shadow-sm">
    <div class="container-lg">
        <a class="navbar-brand fw-semibold" href="${request.contextPath}/">
            Sistema de Cobrancas
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <g:link controller="dashboard" action="index" class="nav-link">
                        <i class="bi-speedometer2"></i> Dashboard
                    </g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="cliente" action="index" class="nav-link">
                        <i class="bi-people"></i> Clientes
                    </g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="cobranca" action="index" class="nav-link">
                        <i class="bi-receipt"></i> Cobranças
                    </g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="webhook" action="index" class="nav-link">
                        <i class="bi-broadcast"></i> Webhook
                    </g:link>
                </li>
            </ul>
            <ul class="navbar-nav ms-3">
                <sec:ifLoggedIn>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i>
                            <sec:username/>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <a class="dropdown-item" href="${request.contextPath}/logoff">
                                    <i class="bi bi-box-arrow-right"></i> Sair
                                </a>
                            </li>
                        </ul>
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <g:link controller="login" action="auth" class="nav-link">
                            <i class="bi bi-box-arrow-in-right"></i> Login
                        </g:link>
                    </li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </div>
</nav>

<div class="bg-body-tertiary">
    <div class="container-lg py-4">
        <g:layoutBody/>
    </div>
</div>

<footer class="border-top py-3" role="contentinfo">
    <div class="container-lg text-body-secondary small">
        Painel interno de clientes e cobrancas
    </div>
</footer>

<div id="spinner" class="position-absolute top-0 end-0 p-1" style="display:none;">
    <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>
</html>
