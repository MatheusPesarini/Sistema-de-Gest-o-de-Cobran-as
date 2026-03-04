<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Nova Cobrança</title>
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
                        <g:link class="nav-link" action="index"><i class="bi-receipt"></i> Lista de Cobranças</g:link>
                    </li>
                </ul>
            </nav>
        </section>

        <section class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header">
                        <h4 class="mb-0"><i class="bi-receipt"></i> Nova Cobrança</h4>
                    </div>
                    <div class="card-body">

                        <g:if test="${flash.message}">
                            <div class="alert alert-info"><i class="bi-info-circle"></i> ${flash.message}</div>
                        </g:if>

                        <g:hasErrors bean="${cobranca}">
                            <ul class="alert alert-danger list-unstyled">
                                <g:eachError bean="${cobranca}" var="error">
                                    <li><i class="bi-exclamation-circle"></i> <g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <g:form controller="cobranca" action="save" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="cliente.id">Cliente <span class="text-danger">*</span></label>
                                <g:select name="cliente.id"
                                          from="${clientes}"
                                          optionKey="id"
                                          optionValue="nome"
                                          value="${params.clienteId ?: cobranca?.cliente?.id}"
                                          noSelection="['': '-- Selecione um cliente --']"
                                          class="form-select"
                                          required="required"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="descricao">Descrição</label>
                                <g:textField name="descricao" value="${cobranca?.descricao}" class="form-control" placeholder="Ex: Mensalidade Janeiro 2025"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="valor">Valor (R$) <span class="text-danger">*</span></label>
                                <g:field type="number" name="valor" value="${cobranca?.valor}" class="form-control" step="0.01" min="0.01" placeholder="0,00" required="required"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold" for="dataVencimento">Data de Vencimento <span class="text-danger">*</span></label>
                                <g:field type="date" name="dataVencimento"
                                         value="${cobranca?.dataVencimento ? cobranca.dataVencimento.format('yyyy-MM-dd') : ''}"
                                         class="form-control" required="required"/>
                            </div>
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi-send"></i> Gerar Cobrança
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
