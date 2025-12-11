<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Plateforme de Commerce Électronique - Accueil</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <style>
        /* Temporary debug styles to verify CSS is working */
        .debug-border {
            border: 2px solid red !important;
        }
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="main-content">
        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-container">
                <h1 class="hero-title">Bienvenue sur notre Plateforme E-Commerce</h1>
                <p class="hero-subtitle">Découvrez nos produits exclusifs avec des promotions exceptionnelles</p>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-hero">
                    Voir les produits
                </a>
            </div>
        </section>

        <!-- Promotions -->
        <c:if test="${not empty promotions}">
            <section class="promotion-section">
                <div class="container">
                    <h2 class="section-title">🔥 Promotions en cours</h2>
                    <div class="promotions-grid">
                        <c:forEach var="promotion" items="${promotions}">
                            <div class="promotion-card">
                                <div class="promotion-content">
                                    <div class="discount-badge">-${promotion.discountPercentage}%</div>
                                    <h3 class="promotion-name">${promotion.name}</h3>
                                    <p class="promotion-description">${promotion.description}</p>
                                    <small class="promotion-date">
                                        Valide jusqu'au:
                                        <fmt:formatDate value="${promotion.endDate}" pattern="dd/MM/yyyy"/>
                                    </small>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:if>

        <!-- Featured Products -->
        <section class="products-section">
            <div class="container">
                <h2 class="section-title">🎯 Produits populaires</h2>
                <div class="products-grid">
                    <c:forEach var="product" items="${products}" end="7">
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
                                <h3 class="product-title">${product.name}</h3>
                                <p class="product-description">${product.description}</p>
                                <div class="product-price">
                                    <c:choose>
                                        <c:when test="${product.hasPromotion}">
                                            <span class="original-price">${product.price} €</span>
                                            <span class="current-price">${product.discountPrice} €</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="current-price">${product.price} €</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="product-actions">
                                    <a href="${pageContext.request.contextPath}/product/${product.id}"
                                       class="btn btn-secondary btn-view">Voir détails</a>
                                    <c:if test="${product.stock > 0}">
                                        <form action="${pageContext.request.contextPath}/cart/add" method="post" class="add-to-cart-form">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <input type="hidden" name="quantity" value="1">
                                            <button type="submit" class="btn btn-primary btn-add">Ajouter</button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-large">
                        Voir tous les produits
                    </a>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section class="category-section">
            <div class="container">
                <h2 class="section-title">📁 Catégories</h2>
                <div class="categories-grid">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-laptop"></i>
                        </div>
                        <div class="category-content">
                            <h3 class="category-title">Électronique</h3>
                            <p class="category-description">Smartphones, ordinateurs, tablettes</p>
                            <a href="${pageContext.request.contextPath}/products?category=1" class="btn btn-secondary">
                                Explorer →
                            </a>
                        </div>
                    </div>
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-tshirt"></i>
                        </div>
                        <div class="category-content">
                            <h3 class="category-title">Vêtements</h3>
                            <p class="category-description">Mode pour hommes, femmes, enfants</p>
                            <a href="${pageContext.request.contextPath}/products?category=2" class="btn btn-secondary">
                                Explorer →
                            </a>
                        </div>
                    </div>
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="category-content">
                            <h3 class="category-title">Livres</h3>
                            <p class="category-description">Romans, éducatifs, magazines</p>
                            <a href="${pageContext.request.contextPath}/products?category=3" class="btn btn-secondary">
                                Explorer →
                            </a>
                        </div>
                    </div>
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="category-content">
                            <h3 class="category-title">Maison</h3>
                            <p class="category-description">Meubles, décoration, électroménager</p>
                            <a href="${pageContext.request.contextPath}/products?category=4" class="btn btn-secondary">
                                Explorer →
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <p>&copy; 2024 Plateforme de Commerce Électronique. Tous droits réservés.</p>
            </div>
        </div>
    </footer>
</body>
</html>