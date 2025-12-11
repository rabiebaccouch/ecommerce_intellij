<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Produits - Admin</title>
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
                <a href="${pageContext.request.contextPath}/admin/products" class="active">
                    📦 Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories">
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
                <h1>Gestion des produits</h1>
                <button class="btn-primary" onclick="showProductForm()">
                    + Ajouter un produit
                </button>
            </header>

            <!-- Product Form (hidden by default) -->
            <div class="admin-form" id="productForm" style="display: none;">
                <h2>Nouveau produit</h2>
                <form action="${pageContext.request.contextPath}/admin/products" method="post">
                    <input type="hidden" name="id" id="productId">

                    <div class="form-group">
                        <label for="name">Nom du produit *</label>
                        <input type="text" id="name" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Description *</label>
                        <textarea id="description" name="description" rows="4" required></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="price">Prix *</label>
                            <input type="number" id="price" name="price" step="0.01" required>
                        </div>

                        <div class="form-group">
                            <label for="stock">Stock *</label>
                            <input type="number" id="stock" name="stock" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="categoryId">Catégorie *</label>
                        <select id="categoryId" name="categoryId" required>
                            <option value="">Sélectionner une catégorie</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="imageUrl">URL de l'image</label>
                        <input type="text" id="imageUrl" name="imageUrl"
                               placeholder="ex: product.jpg">
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-secondary" onclick="hideProductForm()">
                            Annuler
                        </button>
                        <button type="submit" class="btn-primary">
                            Enregistrer
                        </button>
                    </div>
                </form>
            </div>

            <!-- Products Table -->
            <div class="products-table">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Nom</th>
                            <th>Catégorie</th>
                            <th>Prix</th>
                            <th>Stock</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td>#${product.id}</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/products/${product.imageUrl}"
                                         alt="${product.name}"
                                         onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'"
                                         style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;">
                                </td>
                                <td>${product.name}</td>
                                <td>
                                    <c:forEach var="category" items="${categories}">
                                        <c:if test="${category.id == product.categoryId}">
                                            ${category.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>${product.price} €</td>
                                <td>
                                    <span class="stock-badge ${product.stock > 0 ? 'in-stock' : 'out-of-stock'}">
                                        ${product.stock}
                                    </span>
                                </td>
                                <td class="table-actions">
                                    <button class="btn-secondary btn-small"
                                            onclick="editProduct(${product.id})">
                                        ✏️
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}"
                                       class="btn-danger btn-small"
                                       onclick="return confirm('Supprimer ce produit?')">
                                        🗑️
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <style>
        .stock-badge {
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
        }

        .stock-badge.in-stock {
            background: #c6f6d5;
            color: #22543d;
        }

        .stock-badge.out-of-stock {
            background: #fed7d7;
            color: #742a2a;
        }

        .btn-small {
            padding: 0.3rem 0.8rem;
            font-size: 0.9rem;
        }

        .products-table {
            margin-top: 2rem;
        }

        .admin-form {
            margin-bottom: 2rem;
        }
    </style>

    <script>
        function showProductForm() {
            document.getElementById('productForm').style.display = 'block';
            // Clear form for new product
            document.getElementById('productForm').querySelector('form').reset();
            document.getElementById('productId').value = '';
            document.getElementById('productForm').querySelector('h2').textContent = 'Nouveau produit';
        }

        function hideProductForm() {
            document.getElementById('productForm').style.display = 'none';
        }

        function editProduct(productId) {
            // Fetch product data (in real app, this would be an AJAX call)
            const products = ${products != null ? products : '[]'};
            const product = products.find(p => p.id == productId);

            if (product) {
                // Fill form with product data
                document.getElementById('productId').value = product.id;
                document.getElementById('name').value = product.name;
                document.getElementById('description').value = product.description;
                document.getElementById('price').value = product.price;
                document.getElementById('stock').value = product.stock;
                document.getElementById('categoryId').value = product.categoryId;
                document.getElementById('imageUrl').value = product.imageUrl || '';

                // Update form title
                document.getElementById('productForm').querySelector('h2').textContent = 'Modifier le produit';

                // Show form
                document.getElementById('productForm').style.display = 'block';

                // Scroll to form
                document.getElementById('productForm').scrollIntoView({ behavior: 'smooth' });
            }
        }
    </script>
</body>
</html>