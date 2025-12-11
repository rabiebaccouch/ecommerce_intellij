<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Produits - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <div class="products-header">
            <h1>
                <c:choose>
                    <c:when test="${not empty category}">
                        ${category.name}
                    </c:when>
                    <c:when test="${not empty searchKeyword}">
                        Résultats pour: "${searchKeyword}"
                    </c:when>
                    <c:otherwise>
                        Tous les produits
                    </c:otherwise>
                </c:choose>
            </h1>

            <div class="products-tools">
                <div class="filter-section">
                    <form action="${pageContext.request.contextPath}/products" method="get" class="filter-form">
                        <select name="category" onchange="this.form.submit()">
                            <option value="">Toutes les catégories</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.id}"
                                        <c:if test="${param.category == cat.id}">selected</c:if>>
                                    ${cat.name}
                                </option>
                            </c:forEach>
                        </select>

                        <select name="sort" onchange="this.form.submit()">
                            <option value="name">Trier par: Nom</option>
                            <option value="price_asc">Prix: Croissant</option>
                            <option value="price_desc">Prix: Décroissant</option>
                            <option value="newest">Plus récents</option>
                        </select>
                    </form>
                </div>

                <div class="products-count">
                    ${not empty products ? products.size() : 0} produits trouvés
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty products and not empty products[0]}">
                <div class="products-grid">
                    <c:forEach var="product" items="${products}">
                        <div class="product-card">
                            <div class="product-image">
                                <img src="${pageContext.request.contextPath}/assets/images/products/${product.imageUrl}"
                                     alt="${product.name}"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'">
                                <c:if test="${product.hasPromotion}">
                                    <div class="product-badge">PROMO</div>
                                </c:if>
                            </div>

                            <div class="product-info">
                                <h3>${product.name}</h3>
                                <p class="product-description">${product.description}</p>

                                <div class="product-meta">
                                    <span class="category">
                                        Catégorie:
                                        <c:forEach var="cat" items="${categories}">
                                            <c:if test="${cat.id == product.categoryId}">
                                                ${cat.name}
                                            </c:if>
                                        </c:forEach>
                                    </span>
                                    <span class="stock ${product.stock > 0 ? 'in-stock' : 'out-of-stock'}">
                                        ${product.stock > 0 ? 'En stock' : 'Rupture'}
                                    </span>
                                </div>

                                <div class="product-price">
                                    <c:choose>
                                        <c:when test="${product.hasPromotion}">
                                            <span class="old-price">${product.price} €</span>
                                            <span class="new-price">${product.discountPrice} €</span>
                                            <span class="discount">-${100 - (product.discountPrice * 100 / product.price)}%</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="price">${product.price} €</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="product-actions">
                                    <a href="${pageContext.request.contextPath}/product/${product.id}"
                                       class="btn-secondary">Détails</a>

                                    <c:if test="${product.stock > 0}">
                                        <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <input type="hidden" name="quantity" value="1">
                                            <button type="submit" class="btn-primary">
                                                Ajouter au panier
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <h3>Aucun produit trouvé</h3>
                    <p>Essayez de modifier vos critères de recherche</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn-primary">
                        Voir tous les produits
                    </a>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Pagination (simplified for demo) -->
        <c:if test="${not empty products and not empty products[0]}">
            <div class="pagination">
                <a href="#" class="page-link disabled">← Précédent</a>
                <a href="#" class="page-link active">1</a>
                <a href="#" class="page-link">2</a>
                <a href="#" class="page-link">3</a>
                <a href="#" class="page-link">Suivant →</a>
            </div>
        </c:if>
    </div>
</body>
</html>