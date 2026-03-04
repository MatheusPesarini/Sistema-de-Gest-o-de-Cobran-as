<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Clientes</title>
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
                        <g:link class="btn btn-primary btn-sm" action="create">
                            <i class="bi-person-plus"></i> Novo Cliente
                        </g:link>
                    </li>
                </ul>
            </nav>
        </section>

        <section class="row">
            <div class="col-12">
                <h3><i class="bi-people"></i> Clientes</h3>

                <g:if test="${flash.message}">
                    <div class="alert alert-success"><i class="bi-check-circle"></i> ${flash.message}</div>
                </g:if>

                <g:if test="${clienteList}">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-sm align-middle">
                            <thead class="table-dark">
                            <tr>
                                <th>Nome</th>
                                <th>CPF/CNPJ</th>
                                <th>E-mail</th>
                                <th>Telefone</th>
                                <th class="text-center">Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${clienteList}" var="c">
                                <tr>
                                    <td>${c.nome}</td>
                                    <td>${c.cpfCnpj}</td>
                                    <td>${c.email}</td>
                                    <td>${c.telefone ?: '-'}</td>
                                    <td class="text-center">
                                        <g:link action="show" id="${c.id}" class="btn btn-sm btn-outline-primary">
                                            <i class="bi-eye"></i> Ver
                                        </g:link>
                                        <g:link action="edit" id="${c.id}" class="btn btn-sm btn-outline-secondary">
                                            <i class="bi-pencil"></i> Editar
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
                        <i class="bi-info-circle"></i> Nenhum cliente cadastrado ainda.
                        <g:link action="create" class="alert-link">Cadastrar o primeiro cliente</g:link>.
                    </div>
                </g:else>

                <g:if test="${clienteCount > params.int('max', 10)}">
                    <div class="mt-3">
                        <g:paginate total="${clienteCount}"/>
                    </div>
                </g:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>
