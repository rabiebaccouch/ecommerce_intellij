<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.name} - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin: 20px auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">Accueil</a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/products">Produits</a></li>
                <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
            </ol>
        </nav>

        <div class="row">
            <!-- Product Images -->
            <div class="col-lg-6">
                <div class="product-images">
                    <div class="main-image mb-3">
                        <!-- Main product image based on product ID -->
                        <c:choose>
                            <c:when test="${product.id == 1}">
                                <img src="https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=800&h=600&fit=crop"
                                     alt="iPhone 15 Pro" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 2}">
                                <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=800&h=600&fit=crop"
                                     alt="MacBook Air M2" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 3}">
                                <img src="https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=800&h=600&fit=crop"
                                     alt="Samsung Galaxy S24" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 4}">
                                <img src="https://images.unsplash.com/photo-1484704849700-f032a568e944?w=800&h=600&fit=crop"
                                     alt="Casque Sony" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 5}">
                                <img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&h=600&fit=crop"
                                     alt="T-shirt Blanc" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 6}">
                                <img src="https://images.unsplash.com/photo-1544441893-675973e31985?w=800&h=600&fit=crop"
                                     alt="Jean Slim" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 7}">
                                <img src="https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=800&h=600&fit=crop"
                                     alt="Pull en Laine" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 8}">
                                <img src="https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=800&h=600&fit=crop"
                                     alt="Robe d'Été" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 9}">
                                <img src="https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=800&h=600&fit=crop"
                                     alt="Clean Code" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 10}">
                                <img src="https://images.unsplash.com/photo-1531346688376-ab6275c4725e?w=800&h=600&fit=crop"
                                     alt="Design Patterns" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 11}">
                                <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=800&h=600&fit=crop"
                                     alt="Le Seigneur des Anneaux" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 12}">
                                <img src="https://images.unsplash.com/photo-1592496005605-ec0b5e1c8114?w=800&h=600&fit=crop"
                                     alt="Harry Potter" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 13}">
                                <img src="https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800&h=600&fit=crop"
                                     alt="Machine à Café" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 14}">
                                <img src="https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?w=800&h=600&fit=crop"
                                     alt="Table à Manger" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 15}">
                                <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800&h=600&fit=crop"
                                     alt="Canapé 3 Places" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 16}">
                                <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=600&fit=crop"
                                     alt="Aspirateur Robot" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 17}">
                                <img src="https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=800&h=600&fit=crop"
                                     alt="Vélo de Course" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 18}">
                                <img src="https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?w=800&h=600&fit=crop"
                                     alt="Tapis de Yoga" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 19}">
                                <img src="https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=800&h=600&fit=crop"
                                     alt="Parfum Signature" class="img-fluid rounded">
                            </c:when>
                            <c:when test="${product.id == 20}">
                                <img src="https://images.unsplash.com/photo-1556228578-9c360e1d8d34?w=800&h=600&fit=crop"
                                     alt="Kit Soins Visage" class="img-fluid rounded">
                            </c:when>
                            <c:otherwise>
                                <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&h=600&fit=crop"
                                     alt="${product.name}" class="img-fluid rounded">
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${product.hasPromotion}">
                            <div class="position-absolute top-0 end-0 m-3">
                                <span class="badge bg-danger fs-5 p-2">PROMOTION</span>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Product Info -->
            <div class="col-lg-6">
                <div class="product-info-detail">
                    <h1 class="mb-3">${product.name}</h1>

                    <div class="product-meta d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                        <span class="product-category">
                            Catégorie:
                            <c:forEach var="cat" items="${categories}">
                                <c:if test="${cat.id == product.categoryId}">
                                    <span class="badge bg-info">${cat.name}</span>
                                </c:if>
                            </c:forEach>
                        </span>
                        <span class="product-stock ${product.stock > 0 ? 'text-success' : 'text-danger'}">
                            <c:choose>
                                <c:when test="${product.stock > 10}">
                                    <i class="bi bi-check-circle"></i> En stock
                                </c:when>
                                <c:when test="${product.stock > 0}">
                                    <i class="bi bi-exclamation-triangle"></i> Stock limité (${product.stock} restants)
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-x-circle"></i> Rupture de stock
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <div class="product-price-detail mb-4">
                        <c:choose>
                            <c:when test="${product.hasPromotion}">
                                <div class="old-price text-muted text-decoration-line-through fs-4">${product.price} €</div>
                                <div class="new-price text-danger display-4 fw-bold">${product.discountPrice} €</div>
                                <div class="discount-percent badge bg-danger fs-5 mt-2">
                                    Économisez ${product.price - product.discountPrice} €
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="current-price display-4 fw-bold text-primary">${product.price} €</div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="product-description-detail mb-4">
                        <h3 class="h4 mb-3">Description</h3>
                        <p class="lead">${product.description}</p>
                    </div>

                    <!-- Add to Cart Form -->
                    <div class="add-to-cart-section mb-4 p-4 bg-light rounded">
                        <c:choose>
                            <c:when test="${product.stock > 0}">
                                <form action="${pageContext.request.contextPath}/cart/add" method="post" class="cart-form">
                                    <input type="hidden" name="productId" value="${product.id}">

                                    <div class="row align-items-center mb-4">
                                        <div class="col-md-4">
                                            <label for="quantity" class="form-label fw-bold">Quantité:</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="number" class="form-control form-control-lg" id="quantity" name="quantity"
                                                   value="1" min="1" max="${product.stock}">
                                        </div>
                                    </div>

                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary btn-lg">
                                            <i class="bi bi-cart-plus"></i> Ajouter au panier
                                        </button>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div class="out-of-stock-message text-center">
                                    <i class="bi bi-x-circle display-1 text-danger mb-3"></i>
                                    <p class="fs-5 text-danger">Ce produit est actuellement en rupture de stock.</p>
                                    <button class="btn btn-secondary btn-lg" disabled>Indisponible</button>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Product Details -->
                    <div class="product-specs">
                        <h3 class="h4 mb-3">Détails du produit</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tbody>
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
                                        <td>
                                            <span class="badge ${product.stock > 0 ? 'bg-success' : 'bg-danger'} fs-6">
                                                ${product.stock} unités
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Promotion:</strong></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${product.hasPromotion}">
                                                    <span class="badge bg-success">
                                                        <i class="bi bi-check-circle"></i> Active (-${100 - (product.discountPrice * 100 / product.price)}%)
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">
                                                        <i class="bi bi-x-circle"></i> Aucune
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Related Products -->
        <c:if test="${not empty relatedProducts}">
            <div class="related-products mt-5">
                <h2 class="text-center mb-4">Produits similaires</h2>
                <div class="row">
                    <c:forEach var="relatedProduct" items="${relatedProducts}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                            <div class="product-card h-100">
                                <!-- Related product images based on ID -->
                                <c:choose>
                                    <c:when test="${relatedProduct.id == 1}">
                                        <img src="https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&h=400&fit=crop"
                                             alt="iPhone 15 Pro" class="card-img-top">
                                    </c:when>
                                    <c:when test="${relatedProduct.id == 2}">
                                        <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=600&h=400&fit=crop"
                                             alt="MacBook Air M2" class="card-img-top">
                                    </c:when>
                                    <c:when test="${relatedProduct.id == 3}">
                                        <img src="https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&h=400&fit=crop"
                                             alt="Samsung Galaxy S24" class="card-img-top">
                                    </c:when>
                                    <c:when test="${relatedProduct.id == 4}">
                                        <img src="https://images.unsplash.com/photo-1484704849700-f032a568e944?w=600&h=400&fit=crop"
                                             alt="Casque Sony" class="card-img-top">
                                    </c:when>
                                    <c:when test="${relatedProduct.id == 5}">
                                        <img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600&h=400&fit=crop"
                                             alt="T-shirt Blanc" class="card-img-top">
                                    </c:when>
                                    <c:when test="${relatedProduct.id == 6}">
                                        <img src="https://images.unsplash.com/photo-1544441893-675973e31985?w=600&h=400&fit=crop"
                                             alt="Jean Slim" class="card-img-top">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=600&h=400&fit=crop"
                                             alt="${relatedProduct.name}" class="card-img-top">
                                    </c:otherwise>
                                </c:choose>
                                <div class="card-body">
                                    <h3 class="h5">${relatedProduct.name}</h3>
                                    <p class="product-description text-muted">${relatedProduct.description}</p>
                                    <div class="product-price mb-3">
                                        <span class="price fw-bold text-primary">${relatedProduct.getFinalPrice()} €</span>
                                    </div>
                                    <div class="product-actions d-grid gap-2">
                                        <a href="${pageContext.request.contextPath}/product/${relatedProduct.id}"
                                           class="btn btn-outline-primary">Voir détails</a>
                                        <c:if test="${relatedProduct.stock > 0}">
                                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                                <input type="hidden" name="productId" value="${relatedProduct.id}">
                                                <input type="hidden" name="quantity" value="1">
                                                <button type="submit" class="btn btn-primary w-100">Ajouter</button>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>