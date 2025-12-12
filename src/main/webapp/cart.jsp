<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Panier - Plateforme E-Commerce</title>
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
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin: 20px auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* ADD THESE STYLES FOR BUTTON CONSISTENCY */
        .btn-outline-primary {
            border-color: #1e3c72;
            color: #1e3c72;
        }
        .btn-outline-primary:hover {
            background: #1e3c72;
            border-color: #1e3c72;
            color: white;
        }
        .btn-outline-danger {
            border-color: #dc3545;
            color: #dc3545;
        }
        .btn-outline-danger:hover {
            background: #dc3545;
            border-color: #dc3545;
            color: white;
        }
        .btn-primary {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border: none;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #2a5298, #1e3c72);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .btn-danger {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            border: none;
            transition: all 0.3s ease;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #ee5a24, #ff6b6b);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .btn-lg {
            border-radius: 50px;
            padding: 12px 30px;
            font-size: 1.1rem;
        }

        /* Cart item styling improvements */
        .cart-item {
            border-radius: 15px;
            transition: all 0.3s ease;
        }
        .cart-item:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .cart-summary {
            border-radius: 15px;
        }

        /* Form input styling */
        .form-control:focus {
            border-color: #1e3c72;
            box-shadow: 0 0 0 0.25rem rgba(30, 60, 114, 0.25);
        }
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <h1 class="text-center mb-4">
            <i class="bi bi-cart3"></i> Votre panier
        </h1>

        <c:choose>
            <c:when test="${not empty cartItems and not empty cartItems[0]}">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-items">
                            <c:forEach var="item" items="${cartItems}">
                                <div class="cart-item mb-3 p-3 border rounded">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="cart-item-image">
                                                <!-- Cart item images based on product ID -->
                                                <c:choose>
                                                    <c:when test="${item.product.id == 1}">
                                                        <img src="https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=200&h=200&fit=crop"
                                                             alt="iPhone 15 Pro" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 2}">
                                                        <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=200&h=200&fit=crop"
                                                             alt="MacBook Air M2" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 3}">
                                                        <img src="https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=200&h=200&fit=crop"
                                                             alt="Samsung Galaxy S24" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 4}">
                                                        <img src="https://images.unsplash.com/photo-1484704849700-f032a568e944?w=200&h=200&fit=crop"
                                                             alt="Casque Sony" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 5}">
                                                        <img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=200&h=200&fit=crop"
                                                             alt="T-shirt Blanc" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 6}">
                                                        <img src="https://images.unsplash.com/photo-1544441893-675973e31985?w=200&h=200&fit=crop"
                                                             alt="Jean Slim" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 7}">
                                                        <img src="https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=200&h=200&fit=crop"
                                                             alt="Pull en Laine" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 8}">
                                                        <img src="https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=200&h=200&fit=crop"
                                                             alt="Robe d'Été" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 9}">
                                                        <img src="https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=200&h=200&fit=crop"
                                                             alt="Clean Code" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 10}">
                                                        <img src="https://images.unsplash.com/photo-1531346688376-ab6275c4725e?w=200&h=200&fit=crop"
                                                             alt="Design Patterns" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 11}">
                                                        <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=200&h=200&fit=crop"
                                                             alt="Le Seigneur des Anneaux" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 12}">
                                                        <img src="https://images.unsplash.com/photo-1592496005605-ec0b5e1c8114?w=200&h=200&fit=crop"
                                                             alt="Harry Potter" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 13}">
                                                        <img src="https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=200&h=200&fit=crop"
                                                             alt="Machine à Café" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 14}">
                                                        <img src="https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?w=200&h=200&fit=crop"
                                                             alt="Table à Manger" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 15}">
                                                        <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=200&h=200&fit=crop"
                                                             alt="Canapé 3 Places" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 16}">
                                                        <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=200&fit=crop"
                                                             alt="Aspirateur Robot" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 17}">
                                                        <img src="https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=200&h=200&fit=crop"
                                                             alt="Vélo de Course" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 18}">
                                                        <img src="https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?w=200&h=200&fit=crop"
                                                             alt="Tapis de Yoga" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 19}">
                                                        <img src="https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=200&h=200&fit=crop"
                                                             alt="Parfum Signature" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:when test="${item.product.id == 20}">
                                                        <img src="https://images.unsplash.com/photo-1556228578-9c360e1d8d34?w=200&h=200&fit=crop"
                                                             alt="Kit Soins Visage" class="img-fluid rounded">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=200&h=200&fit=crop"
                                                             alt="${item.product.name}" class="img-fluid rounded">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>

                                        <div class="col-md-9">
                                            <div class="cart-item-info">
                                                <h3 class="h5">${item.product.name}</h3>
                                                <p class="item-description text-muted">${item.product.description}</p>
                                                <div class="item-price h5 mb-3">
                                                    ${item.product.getFinalPrice()} € × ${item.quantity} =
                                                    <strong>${item.totalPrice} €</strong>
                                                </div>

                                                <div class="item-actions">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-6">
                                                            <form action="${pageContext.request.contextPath}/cart/update" method="post" class="quantity-form">
                                                                <input type="hidden" name="productId" value="${item.product.id}">
                                                                <div class="input-group">
                                                                    <span class="input-group-text">Quantité:</span>
                                                                    <input type="number" class="form-control" name="quantity" value="${item.quantity}" min="1"
                                                                           max="${item.product.stock}" onchange="this.form.submit()">
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-6 text-end">
                                                            <form action="${pageContext.request.contextPath}/cart/remove" method="post" class="remove-form d-inline">
                                                                <input type="hidden" name="productId" value="${item.product.id}">
                                                                <button type="submit" class="btn btn-danger">
                                                                    <i class="bi bi-trash"></i> Supprimer
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="cart-summary p-4 border rounded bg-light">
                            <h2 class="h4 mb-4">Résumé de la commande</h2>

                            <div class="summary-details mb-4">
                                <div class="summary-row d-flex justify-content-between mb-2">
                                    <span>Sous-total:</span>
                                    <span>${total} €</span>
                                </div>
                                <div class="summary-row d-flex justify-content-between mb-2">
                                    <span>Frais de livraison:</span>
                                    <span class="text-success">Gratuit</span>
                                </div>
                                <div class="summary-row d-flex justify-content-between mb-2">
                                    <span>Taxes:</span>
                                    <span>${total * 0.2} €</span>
                                </div>
                                <hr>
                                <div class="summary-row total d-flex justify-content-between h4">
                                    <strong>Total:</strong>
                                    <strong>${total + (total * 0.2)} €</strong>
                                </div>
                            </div>

                            <div class="summary-actions d-grid gap-2 mb-3">
                                <form action="${pageContext.request.contextPath}/cart/clear" method="post">
                                    <button type="submit" class="btn btn-outline-danger w-100">
                                        <i class="bi bi-trash"></i> Vider le panier
                                    </button>
                                </form>

                                <a href="${pageContext.request.contextPath}/checkout" class="btn btn-primary btn-lg">
                                    <i class="bi bi-credit-card"></i> Procéder au paiement
                                </a>
                            </div>

                            <div class="continue-shopping text-center">
                                <a href="${pageContext.request.contextPath}/products" class="text-decoration-none">
                                    <i class="bi bi-arrow-left"></i> Continuer vos achats
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-cart text-center py-5">
                    <i class="bi bi-cart-x display-1 text-muted mb-4"></i>
                    <h2>Votre panier est vide</h2>
                    <p class="text-muted">Ajoutez des produits à votre panier pour les acheter</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-lg mt-3">
                        <i class="bi bi-bag"></i> Découvrir les produits
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>