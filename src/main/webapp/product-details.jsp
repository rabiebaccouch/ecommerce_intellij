<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.name} - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/home">Accueil</a> >
            <a href="${pageContext.request.contextPath}/products">Produits</a> >
            <span>${product.name}</span>
        </div>

        <div class="product-detail-container">
            <!-- Product Images -->
            <div class="product-images">
                <div class="main-image">
                    <img src="${pageContext.request.contextPath}/assets/images/products/${product.imageUrl}"
                         alt="${product.name}"
                         onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'">
                    <c:if test="${product.hasPromotion}">
                        <div class="product-badge large">PROMOTION</div>
                    </c:if>
                </div>
            </div>

            <!-- Product Info -->
            <div class="product-info-detail">
                <h1>${product.name}</h1>

                <div class="product-meta">
                    <span class="product-category">
                        Catégorie:
                        <c:forEach var="cat" items="${categories}">
                            <c:if test="${cat.id == product.categoryId}">
                                ${cat.name}
                            </c:if>
                        </c:forEach>
                    </span>
                    <span class="product-stock ${product.stock > 0 ? 'in-stock' : 'out-of-stock'}">
                        <c:choose>
                            <c:when test="${product.stock > 10}">
                                ✅ En stock
                            </c:when>
                            <c:when test="${product.stock > 0}">
                                ⚠️ Stock limité (${product.stock} restants)
                            </c:when>
                            <c:otherwise>
                                ❌ Rupture de stock
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>

                <div class="product-price-detail">
                    <c:choose>
                        <c:when test="${product.hasPromotion}">
                            <div class="old-price">${product.price} €</div>
                            <div class="new-price">${product.discountPrice} €</div>
                            <div class="discount-percent">
                                Économisez ${product.price - product.discountPrice} €
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="current-price">${product.price} €</div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="product-description-detail">
                    <h3>Description</h3>
                    <p>${product.description}</p>
                </div>

                <!-- Add to Cart Form -->
                <div class="add-to-cart-section">
                    <c:choose>
                        <c:when test="${product.stock > 0}">
                            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="cart-form">
                                <input type="hidden" name="productId" value="${product.id}">

                                <div class="quantity-selector">
                                    <label for="quantity">Quantité:</label>
                                    <input type="number" id="quantity" name="quantity"
                                           value="1" min="1" max="${product.stock}">
                                </div>

                                <button type="submit" class="btn-primary btn-large">
                                    🛒 Ajouter au panier
                                </button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <div class="out-of-stock-message">
                                <p>Ce produit est actuellement en rupture de stock.</p>
                                <button class="btn-secondary" disabled>Indisponible</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Product Details -->
                <div class="product-specs">
                    <h3>Détails du produit</h3>
                    <table class="specs-table">
                        <tr>
                            <td><strong>ID Produit:</strong></td>
                            <td>#${product.id}</td>
                        </tr>
                        <tr>
                            <td><strong>Catégorie:</strong></td>
                            <td>
                                <c:forEach var="cat" items="${categories}">
                                    <c:if test="${cat.id == product.categoryId}">
                                        ${cat.name}
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Stock disponible:</strong></td>
                            <td>${product.stock} unités</td>
                        </tr>
                        <tr>
                            <td><strong>Promotion:</strong></td>
                            <td>
                                <c:choose>
                                    <c:when test="${product.hasPromotion}">
                                        ✅ Active (-${100 - (product.discountPrice * 100 / product.price)}%)
                                    </c:when>
                                    <c:otherwise>
                                        ❌ Aucune
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <!-- Related Products -->
        <c:if test="${not empty relatedProducts}">
            <div class="related-products">
                <h2>Produits similaires</h2>
                <div class="products-grid">
                    <c:forEach var="relatedProduct" items="${relatedProducts}">
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/assets/images/products/${relatedProduct.imageUrl}"
                                 alt="${relatedProduct.name}"
                                 onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'">
                            <div class="product-info">
                                <h3>${relatedProduct.name}</h3>
                                <p class="product-description">${relatedProduct.description}</p>
                                <div class="product-price">
                                    <span class="price">${relatedProduct.getFinalPrice()} €</span>
                                </div>
                                <div class="product-actions">
                                    <a href="${pageContext.request.contextPath}/product/${relatedProduct.id}"
                                       class="btn-secondary">Voir détails</a>
                                    <c:if test="${relatedProduct.stock > 0}">
                                        <form action="${pageContext.request.contextPath}/cart/add" method="post" style="display: inline;">
                                            <input type="hidden" name="productId" value="${relatedProduct.id}">
                                            <input type="hidden" name="quantity" value="1">
                                            <button type="submit" class="btn-primary">Ajouter</button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>

    <style>
        .breadcrumb {
            margin-bottom: 2rem;
            font-size: 0.9rem;
            color: #718096;
        }

        .breadcrumb a {
            color: #667eea;
            text-decoration: none;
        }

        .breadcrumb span {
            color: #4a5568;
        }

        .product-detail-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            margin-bottom: 4rem;
        }

        .product-images {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .main-image {
            position: relative;
            height: 400px;
            overflow: hidden;
            border-radius: 10px;
        }

        .main-image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .product-badge.large {
            position: absolute;
            top: 15px;
            right: 15px;
            background: #f56565;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .product-info-detail {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .product-meta {
            display: flex;
            justify-content: space-between;
            margin: 1rem 0;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .product-price-detail {
            margin: 2rem 0;
        }

        .current-price {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2d3748;
        }

        .old-price {
            font-size: 1.5rem;
            color: #a0aec0;
            text-decoration: line-through;
        }

        .new-price {
            font-size: 2.5rem;
            font-weight: bold;
            color: #f56565;
        }

        .discount-percent {
            background: #fed7d7;
            color: #c53030;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            display: inline-block;
            margin-top: 0.5rem;
        }

        .add-to-cart-section {
            margin: 2rem 0;
            padding: 2rem;
            background: #f7fafc;
            border-radius: 10px;
        }

        .cart-form {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .quantity-selector input {
            width: 80px;
            padding: 0.5rem;
            border: 2px solid #e2e8f0;
            border-radius: 5px;
            font-size: 1rem;
        }

        .btn-large {
            padding: 1rem 2rem;
            font-size: 1.1rem;
        }

        .product-specs {
            margin-top: 2rem;
        }

        .specs-table {
            width: 100%;
            border-collapse: collapse;
        }

        .specs-table tr {
            border-bottom: 1px solid #e2e8f0;
        }

        .specs-table td {
            padding: 0.8rem 0;
        }

        .specs-table td:first-child {
            width: 150px;
            color: #718096;
        }

        .related-products {
            margin-top: 4rem;
        }

        .out-of-stock-message {
            text-align: center;
            padding: 2rem;
            background: #fed7d7;
            border-radius: 10px;
            color: #742a2a;
        }

        @media (max-width: 768px) {
            .product-detail-container {
                grid-template-columns: 1fr;
            }

            .cart-form {
                flex-direction: column;
                align-items: stretch;
            }

            .quantity-selector {
                justify-content: space-between;
            }
        }
    </style>
</body>
</html>