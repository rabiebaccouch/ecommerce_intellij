<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Catégories - Admin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
        }
        .admin-content {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="admin-container">
        <aside class="admin-sidebar">
            <div class="admin-profile">
                <h3>Administrateur</h3>
                <p>${sessionScope.username}</p>
            </div>

            <nav class="admin-nav">
                <a href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="bi bi-speedometer2"></i> Tableau de bord
                </a>
                <a href="${pageContext.request.contextPath}/admin/products">
                    <i class="bi bi-box"></i> Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories" class="active">
                    <i class="bi bi-folder"></i> Catégories
                </a>
                <a href="${pageContext.request.contextPath}/admin/promotions">
                    <i class="bi bi-tag"></i> Promotions
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="logout">
                    <i class="bi bi-box-arrow-right"></i> Déconnexion
                </a>
            </nav>
        </aside>

        <main class="admin-content">
            <header class="admin-header">
                <h1>Gestion des catégories</h1>
                <button class="btn btn-primary" onclick="showCategoryForm()">
                    <i class="bi bi-plus-circle"></i> Nouvelle catégorie
                </button>
            </header>

            <!-- Category Form -->
            <div class="admin-form" id="categoryForm" style="display: none;">
                <h2 id="formTitle">Nouvelle catégorie</h2>
                <form action="${pageContext.request.contextPath}/admin/categories" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" id="categoryId">

                    <div class="mb-3">
                        <label for="catName" class="form-label">Nom de la catégorie *</label>
                        <input type="text" class="form-control" id="catName" name="name" required>
                        <div class="invalid-feedback">
                            Veuillez saisir le nom de la catégorie.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="catDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="catDescription" name="description" rows="3"></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hideCategoryForm()">
                            Annuler
                        </button>
                        <button type="submit" class="btn btn-primary">
                            Enregistrer
                        </button>
                    </div>
                </form>
            </div>

            <!-- Categories List -->
            <div class="row mt-4">
                <c:forEach var="category" items="${categories}">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="category-card-admin">
                            <div class="category-header d-flex justify-content-between align-items-start">
                                <h3 class="h5">${category.name}</h3>
                                <div class="category-actions">
                                    <button class="btn btn-warning btn-sm"
                                            onclick="editCategory(${category.id}, '${category.name}', '${category.description}')">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/category/delete/${category.id}"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Supprimer cette catégorie?')">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </div>
                            <p class="text-muted">${category.description}</p>
                            <div class="category-footer d-flex justify-content-between">
                                <span class="category-id text-muted">ID: #${category.id}</span>
                                <span class="product-count badge bg-info">
                                    <c:set var="productCount" value="0" />
                                    <c:forEach var="product" items="${products}">
                                        <c:if test="${product.categoryId == category.id}">
                                            <c:set var="productCount" value="${productCount + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${productCount} produits
                                </span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showCategoryForm() {
            document.getElementById('categoryForm').style.display = 'block';
            document.getElementById('categoryId').value = '';
            document.getElementById('catName').value = '';
            document.getElementById('catDescription').value = '';
            document.getElementById('formTitle').textContent = 'Nouvelle catégorie';
        }

        function hideCategoryForm() {
            document.getElementById('categoryForm').style.display = 'none';
        }

        function editCategory(id, name, description) {
            document.getElementById('categoryId').value = id;
            document.getElementById('catName').value = name;
            document.getElementById('catDescription').value = description;
            document.getElementById('formTitle').textContent = 'Modifier la catégorie';
            document.getElementById('categoryForm').style.display = 'block';
            document.getElementById('categoryForm').scrollIntoView({ behavior: 'smooth' });
        }

        // Bootstrap form validation
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>