<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Paiement - Plateforme E-Commerce</title>
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
        .checkout-container {
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
        <h1 class="text-center mb-4">
            <i class="bi bi-credit-card"></i> Finaliser votre commande
        </h1>

        <div class="checkout-container">
            <!-- Checkout Steps -->
            <div class="checkout-steps mb-5">
                <ul class="nav nav-pills nav-justified">
                    <li class="nav-item">
                        <a class="nav-link disabled">
                            <i class="bi bi-cart"></i> Panier
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">
                            <i class="bi bi-truck"></i> Livraison
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active">
                            <i class="bi bi-credit-card"></i> Paiement
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">
                            <i class="bi bi-check-circle"></i> Confirmation
                        </a>
                    </li>
                </ul>
            </div>

            <div class="row">
                <!-- Left Column: Order Summary -->
                <div class="col-lg-5">
                    <div class="order-summary p-4 border rounded mb-4">
                        <h2 class="h4 mb-4">Résumé de commande</h2>

                        <div class="order-items mb-4">
                            <c:forEach var="item" items="${cartItems}">
                                <div class="order-item mb-3 pb-3 border-bottom">
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <div class="item-image">
                                                <img src="${pageContext.request.contextPath}/assets/images/products/${item.product.imageUrl}"
                                                     alt="${item.product.name}"
                                                     class="img-fluid rounded"
                                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'">
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="item-details">
                                                <h4 class="h6 mb-1">${item.product.name}</h4>
                                                <p class="text-muted mb-1">Quantité: ${item.quantity}</p>
                                                <p class="item-price fw-bold">${item.totalPrice} €</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="order-totals">
                            <div class="total-row d-flex justify-content-between mb-2">
                                <span>Sous-total:</span>
                                <span>${total} €</span>
                            </div>
                            <div class="total-row d-flex justify-content-between mb-2">
                                <span>Livraison:</span>
                                <span class="text-success">Gratuit</span>
                            </div>
                            <div class="total-row d-flex justify-content-between mb-2">
                                <span>Taxes:</span>
                                <span>${total * 0.2} €</span>
                            </div>
                            <hr>
                            <div class="total-row grand-total d-flex justify-content-between h4">
                                <strong>Total:</strong>
                                <strong>${total + (total * 0.2)} €</strong>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Payment Form -->
                <div class="col-lg-7">
                    <div class="payment-form">
                        <h2 class="h4 mb-4">Informations de paiement</h2>

                        <form action="${pageContext.request.contextPath}/checkout/process" method="post" id="paymentForm" class="needs-validation" novalidate>
                            <!-- Shipping Information -->
                            <div class="form-section mb-4 pb-4 border-bottom">
                                <h3 class="h5 mb-3">Adresse de livraison</h3>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="fullName" placeholder="Nom complet" required>
                                    <div class="invalid-feedback">
                                        Veuillez saisir votre nom complet.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="address" placeholder="Adresse" required>
                                    <div class="invalid-feedback">
                                        Veuillez saisir votre adresse.
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="city" placeholder="Ville" required>
                                        <div class="invalid-feedback">
                                            Veuillez saisir votre ville.
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="postalCode" placeholder="Code postal" required>
                                        <div class="invalid-feedback">
                                            Veuillez saisir votre code postal.
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="country" placeholder="Pays" required>
                                    <div class="invalid-feedback">
                                        Veuillez saisir votre pays.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input type="tel" class="form-control" name="phone" placeholder="Téléphone" required>
                                    <div class="invalid-feedback">
                                        Veuillez saisir votre numéro de téléphone.
                                    </div>
                                </div>
                            </div>

                            <!-- Payment Method -->
                            <div class="form-section mb-4 pb-4 border-bottom">
                                <h3 class="h5 mb-3">Méthode de paiement</h3>
                                <div class="payment-methods">
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="creditCard" checked>
                                        <label class="form-check-label d-flex align-items-center" for="creditCard">
                                            <i class="bi bi-credit-card fs-4 me-3"></i>
                                            <div>
                                                <div class="fw-bold">Carte de crédit</div>
                                                <small class="text-muted">Visa, Mastercard, American Express</small>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="paypal" value="paypal">
                                        <label class="form-check-label d-flex align-items-center" for="paypal">
                                            <i class="bi bi-paypal fs-4 me-3 text-primary"></i>
                                            <div>
                                                <div class="fw-bold">PayPal</div>
                                                <small class="text-muted">Paiement sécurisé via PayPal</small>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="bankTransfer" value="bankTransfer">
                                        <label class="form-check-label d-flex align-items-center" for="bankTransfer">
                                            <i class="bi bi-bank fs-4 me-3 text-success"></i>
                                            <div>
                                                <div class="fw-bold">Virement bancaire</div>
                                                <small class="text-muted">Transfert bancaire</small>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Credit Card Details (shown by default) -->
                            <div class="form-section mb-4 pb-4 border-bottom" id="creditCardSection">
                                <h3 class="h5 mb-3">Détails de la carte</h3>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="cardNumber" placeholder="Numéro de carte"
                                           pattern="[0-9]{16}" maxlength="16" required>
                                    <div class="invalid-feedback">
                                        Veuillez saisir un numéro de carte valide (16 chiffres).
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="expiryDate" placeholder="MM/AA"
                                               pattern="(0[1-9]|1[0-2])\/[0-9]{2}" required>
                                        <div class="invalid-feedback">
                                            Veuillez saisir une date d'expiration valide (MM/AA).
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="cvv" placeholder="CVV"
                                               pattern="[0-9]{3}" maxlength="3" required>
                                        <div class="invalid-feedback">
                                            Veuillez saisir un CVV valide (3 chiffres).
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="cardName" placeholder="Nom sur la carte" required>
                                    <div class="invalid-feedback">
                                        Veuillez saisir le nom sur la carte.
                                    </div>
                                </div>
                            </div>

                            <!-- Terms and Conditions -->
                            <div class="form-section mb-4">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="terms" name="terms" required>
                                    <label class="form-check-label" for="terms">
                                        J'accepte les
                                        <a href="#">conditions générales de vente</a>
                                    </label>
                                    <div class="invalid-feedback">
                                        Vous devez accepter les conditions générales de vente.
                                    </div>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="form-actions d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/cart" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Retour au panier
                                </a>
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="bi bi-check-circle"></i> Confirmer la commande
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Show/hide payment method sections
        document.querySelectorAll('input[name="paymentMethod"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const method = this.value;
                const cardSection = document.getElementById('creditCardSection');

                if (method === 'creditCard') {
                    cardSection.style.display = 'block';
                    // Make card fields required
                    cardSection.querySelectorAll('input').forEach(input => {
                        input.required = true;
                    });
                } else {
                    cardSection.style.display = 'none';
                    // Remove required attribute from card fields
                    cardSection.querySelectorAll('input').forEach(input => {
                        input.required = false;
                    });
                }
            });
        });

        // Initialize credit card section as required
        document.getElementById('creditCard').addEventListener('change', function() {
            if (this.checked) {
                document.getElementById('creditCardSection').querySelectorAll('input').forEach(input => {
                    input.required = true;
                });
            }
        });

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