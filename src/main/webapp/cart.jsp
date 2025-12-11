<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Panier - Plateforme E-Commerce</title>
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
        <h1>🛒 Votre panier</h1>

        <c:choose>
            <c:when test="${not empty cartItems and not empty cartItems[0]}">
                <div class="cart-container">
                    <div class="cart-items">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="cart-item">
                                <div class="cart-item-image">
                                    <img src="${pageContext.request.contextPath}/assets/images/products/${item.product.imageUrl}"
                                         alt="${item.product.name}"
                                         onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'">
                                </div>

                                <div class="cart-item-info">
                                    <h3>${item.product.name}</h3>
                                    <p class="item-description">${item.product.description}</p>
                                    <div class="item-price">
                                        ${item.product.getFinalPrice()} € × ${item.quantity} =
                                        <strong>${item.totalPrice} €</strong>
                                    </div>

                                    <div class="item-actions">
                                        <form action="${pageContext.request.contextPath}/cart/update" method="post" class="quantity-form">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <label>Quantité:</label>
                                            <input type="number" name="quantity" value="${item.quantity}" min="1"
                                                   max="${item.product.stock}" onchange="this.form.submit()">
                                        </form>

                                        <form action="${pageContext.request.contextPath}/cart/remove" method="post" class="remove-form">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <button type="submit" class="btn-danger">Supprimer</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="cart-summary">
                        <h2>Résumé de la commande</h2>

                        <div class="summary-details">
                            <div class="summary-row">
                                <span>Sous-total:</span>
                                <span>${total} €</span>
                            </div>
                            <div class="summary-row">
                                <span>Frais de livraison:</span>
                                <span>Gratuit</span>
                            </div>
                            <div class="summary-row">
                                <span>Taxes:</span>
                                <span>${total * 0.2} €</span>
                            </div>
                            <div class="summary-row total">
                                <strong>Total:</strong>
                                <strong>${total + (total * 0.2)} €</strong>
                            </div>
                        </div>

                        <div class="summary-actions">
                            <form action="${pageContext.request.contextPath}/cart/clear" method="post">
                                <button type="submit" class="btn-secondary">Vider le panier</button>
                            </form>

                            <a href="${pageContext.request.contextPath}/checkout" class="btn-primary">
                                Procéder au paiement
                            </a>
                        </div>

                        <div class="continue-shopping">
                            <a href="${pageContext.request.contextPath}/products">
                                ← Continuer vos achats
                            </a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-cart">
                    <div class="empty-icon">🛒</div>
                    <h2>Votre panier est vide</h2>
                    <p>Ajoutez des produits à votre panier pour les acheter</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn-primary">
                        Découvrir les produits
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>