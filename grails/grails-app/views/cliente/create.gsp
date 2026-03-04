<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Novo Cliente</title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row mb-3">
            <nav class="navbar navbar-expand-lg bg-body-tertiary rounded">
                <ul class="navbar-nav container-fluid">
                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(uri: '/')}">
                            <i class="bi-house"></i> Home
                        </a>
                    </li>
                    <li class="nav-item me-lg-auto">
                        <g:link class="nav-link" action="index">
                            <i class="bi-people"></i> Lista de Clientes
                        </g:link>
                    </li>
                </ul>
            </nav>
        </section>

        <section class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header">
                        <h4 class="mb-0"><i class="bi-person-plus"></i> Novo Cliente</h4>
                    </div>
                    <div class="card-body">

                        <g:if test="${flash.message}">
                            <div class="alert alert-info"><i class="bi-info-circle"></i> ${flash.message}</div>
                        </g:if>

                        <g:hasErrors bean="${cliente}">
                            <ul class="alert alert-danger list-unstyled">
                                <g:eachError bean="${cliente}" var="error">
                                    <li><i class="bi-exclamation-circle"></i> <g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <g:form controller="cliente" action="save" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="nome">Nome <span class="text-danger">*</span></label>
                                <g:textField name="nome" value="${cliente?.nome}" class="form-control" placeholder="Nome completo ou razão social" required="required"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="cpfCnpj">CPF / CNPJ <span class="text-danger">*</span></label>
                                <g:textField name="cpfCnpj" value="${cliente?.cpfCnpj}" class="form-control" placeholder="000.000.000-00" required="required"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="email">E-mail <span class="text-danger">*</span></label>
                                <g:textField name="email" value="${cliente?.email}" class="form-control" placeholder="email@exemplo.com" required="required"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="telefone">Telefone</label>
                                <g:textField name="telefone" value="${cliente?.telefone}" class="form-control" placeholder="(11) 99999-9999"/>
                            </div>
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi-floppy"></i> Salvar Cliente
                                </button>
                                <g:link action="index" class="btn btn-outline-secondary">
                                    <i class="bi-x-circle"></i> Cancelar
                                </g:link>
                            </div>
                        </g:form>

                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>
