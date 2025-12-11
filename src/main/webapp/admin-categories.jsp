<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Catégories - Admin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
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
                    📊 Tableau de bord
                </a>
                <a href="${pageContext.request.contextPath}/admin/products">
                    📦 Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories" class="active">
                    🗂️ Catégories
                </a>
                <a href="${pageContext.request.contextPath}/admin/promotions">
                    🏷️ Promotions
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="logout">
                    🚪 Déconnexion
                </a>
            </nav>
        </aside>

        <main class="admin-content">
            <header class="admin-header">
                <h1>Gestion des catégories</h1>
                <button class="btn-primary" onclick="showCategoryForm()">
                    + Nouvelle catégorie
                </button>
            </header>

            <!-- Category Form -->
            <div class="admin-form" id="categoryForm" style="display: none;">
                <h2 id="formTitle">Nouvelle catégorie</h2>
                <form action="${pageContext.request.contextPath}/admin/categories" method="post">
                    <input type="hidden" name="id" id="categoryId">

                    <div class="form-group">
                        <label for="catName">Nom de la catégorie *</label>
                        <input type="text" id="catName" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="catDescription">Description</label>
                        <textarea id="catDescription" name="description" rows="3"></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-secondary" onclick="hideCategoryForm()">
                            Annuler
                        </button>
                        <button type="submit" class="btn-primary">
                            Enregistrer
                        </button>
                    </div>
                </form>
            </div>

            <!-- Categories List -->
            <div class="categories-grid">
                <c:forEach var="category" items="${categories}">
                    <div class="category-card-admin">
                        <div class="category-header">
                            <h3>${category.name}</h3>
                            <div class="category-actions">
                                <button class="btn-secondary btn-small"
                                        onclick="editCategory(${category.id}, '${category.name}', '${category.description}')">
                                    ✏️
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/category/delete/${category.id}"
                                   class="btn-danger btn-small"
                                   onclick="return confirm('Supprimer cette catégorie?')">
                                    🗑️
                                </a>
                            </div>
                        </div>
                        <p>${category.description}</p>
                        <div class="category-footer">
                            <span class="category-id">ID: #${category.id}</span>
                            <span class="product-count">
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
                </c:forEach>
            </div>
        </main>
    </div>

    <style>
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .category-card-admin {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border: 2px solid #e2e8f0;
        }

        .category-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }

        .category-card-admin h3 {
            margin: 0;
            color: #2d3748;
        }

        .category-actions {
            display: flex;
            gap: 0.5rem;
        }

        .category-card-admin p {
            color: #718096;
            margin-bottom: 1rem;
            line-height: 1.5;
        }

        .category-footer {
            display: flex;
            justify-content: space-between;
            padding-top: 1rem;
            border-top: 1px solid #e2e8f0;
            font-size: 0.9rem;
            color: #a0aec0;
        }

        .product-count {
            font-weight: 500;
            color: #4a5568;
        }
    </style>

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
    </script>
</body>
</html>