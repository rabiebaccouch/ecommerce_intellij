<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Paiement - Plateforme E-Commerce</title>
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
        <h1>💳 Finaliser votre commande</h1>

        <div class="checkout-container">
            <!-- Checkout Steps -->
            <div class="checkout-steps">
                <div class="step active">
                    <span class="step-number">1</span>
                    <span class="step-label">Panier</span>
                </div>
                <div class="step active">
                    <span class="step-number">2</span>
                    <span class="step-label">Livraison</span>
                </div>
                <div class="step active">
                    <span class="step-number">3</span>
                    <span class="step-label">Paiement</span>
                </div>
                <div class="step">
                    <span class="step-number">4</span>
                    <span class="step-label">Confirmation</span>
                </div>
            </div>

            <div class="checkout-content">
                <!-- Left Column: Order Summary -->
                <div class="order-summary">
                    <h2>Résumé de commande</h2>

                    <div class="order-items">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="${pageContext.request.contextPath}/assets/images/products/${item.product.imageUrl}"
                                         alt="${item.product.name}"
                                         onerror="this.src='${pageContext.request.contextPath}/assets/images/products/default.jpg'">
                                </div>
                                <div class="item-details">
                                    <h4>${item.product.name}</h4>
                                    <p>Quantité: ${item.quantity}</p>
                                    <p class="item-price">${item.totalPrice} €</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="order-totals">
                        <div class="total-row">
                            <span>Sous-total:</span>
                            <span>${total} €</span>
                        </div>
                        <div class="total-row">
                            <span>Livraison:</span>
                            <span>Gratuit</span>
                        </div>
                        <div class="total-row">
                            <span>Taxes:</span>
                            <span>${total * 0.2} €</span>
                        </div>
                        <div class="total-row grand-total">
                            <strong>Total:</strong>
                            <strong>${total + (total * 0.2)} €</strong>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Payment Form -->
                <div class="payment-form">
                    <h2>Informations de paiement</h2>

                    <form action="${pageContext.request.contextPath}/checkout/process" method="post" id="paymentForm">
                        <!-- Shipping Information -->
                        <div class="form-section">
                            <h3>Adresse de livraison</h3>
                            <div class="form-group">
                                <input type="text" name="fullName" placeholder="Nom complet" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="address" placeholder="Adresse" required>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <input type="text" name="city" placeholder="Ville" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="postalCode" placeholder="Code postal" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="country" placeholder="Pays" required>
                            </div>
                            <div class="form-group">
                                <input type="tel" name="phone" placeholder="Téléphone" required>
                            </div>
                        </div>

                        <!-- Payment Method -->
                        <div class="form-section">
                            <h3>Méthode de paiement</h3>
                            <div class="payment-methods">
                                <label class="payment-method">
                                    <input type="radio" name="paymentMethod" value="creditCard" checked>
                                    <span>Carte de crédit</span>
                                    <div class="payment-icons">💳</div>
                                </label>
                                <label class="payment-method">
                                    <input type="radio" name="paymentMethod" value="paypal">
                                    <span>PayPal</span>
                                    <div class="payment-icons">🔵</div>
                                </label>
                                <label class="payment-method">
                                    <input type="radio" name="paymentMethod" value="bankTransfer">
                                    <span>Virement bancaire</span>
                                    <div class="payment-icons">🏦</div>
                                </label>
                            </div>
                        </div>

                        <!-- Credit Card Details (shown by default) -->
                        <div class="form-section" id="creditCardSection">
                            <h3>Détails de la carte</h3>
                            <div class="form-group">
                                <input type="text" name="cardNumber" placeholder="Numéro de carte"
                                       pattern="[0-9]{16}" maxlength="16">
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <input type="text" name="expiryDate" placeholder="MM/AA"
                                           pattern="(0[1-9]|1[0-2])\/[0-9]{2}">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="cvv" placeholder="CVV"
                                           pattern="[0-9]{3}" maxlength="3">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="cardName" placeholder="Nom sur la carte">
                            </div>
                        </div>

                        <!-- Terms and Conditions -->
                        <div class="form-section">
                            <div class="form-check">
                                <input type="checkbox" id="terms" name="terms" required>
                                <label for="terms">
                                    J'accepte les
                                    <a href="#">conditions générales de vente</a>
                                </label>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="form-actions">
                            <a href="${pageContext.request.contextPath}/cart" class="btn-secondary">
                                ← Retour au panier
                            </a>
                            <button type="submit" class="btn-primary btn-large">
                                Confirmer la commande
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <style>
        .checkout-steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 3rem;
            position: relative;
        }

        .checkout-steps:before {
            content: '';
            position: absolute;
            top: 15px;
            left: 0;
            right: 0;
            height: 2px;
            background: #e2e8f0;
            z-index: 1;
        }

        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 2;
        }

        .step-number {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #e2e8f0;
            color: #718096;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .step.active .step-number {
            background: #667eea;
            color: white;
        }

        .step-label {
            font-size: 0.9rem;
            color: #718096;
        }

        .step.active .step-label {
            color: #667eea;
            font-weight: 500;
        }

        .checkout-content {
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            gap: 3rem;
        }

        .order-summary {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            height: fit-content;
        }

        .order-items {
            max-height: 300px;
            overflow-y: auto;
            margin: 1rem 0;
        }

        .order-item {
            display: flex;
            gap: 1rem;
            padding: 1rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .item-image {
            width: 60px;
            height: 60px;
            border-radius: 5px;
            overflow: hidden;
        }

        .item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .item-details {
            flex: 1;
        }

        .item-details h4 {
            margin-bottom: 0.3rem;
            font-size: 1rem;
        }

        .item-price {
            font-weight: bold;
            color: #2d3748;
        }

        .order-totals {
            border-top: 2px solid #e2e8f0;
            padding-top: 1rem;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .grand-total {
            font-size: 1.2rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 2px solid #4a5568;
        }

        .payment-form {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .form-section:last-child {
            border-bottom: none;
        }

        .payment-methods {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .payment-method {
            display: flex;
            align-items: center;
            padding: 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .payment-method:hover {
            border-color: #cbd5e0;
        }

        .payment-method input[type="radio"]:checked + span {
            font-weight: bold;
            color: #667eea;
        }

        .payment-method input[type="radio"]:checked ~ .payment-icons {
            color: #667eea;
        }

        .payment-method span {
            flex: 1;
            margin-left: 1rem;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        @media (max-width: 1024px) {
            .checkout-content {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .checkout-steps {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .checkout-steps:before {
                display: none;
            }

            .step {
                flex-direction: row;
                gap: 1rem;
            }

            .form-actions {
                flex-direction: column;
                gap: 1rem;
            }
        }
    </style>

    <script>
        // Show/hide payment method sections
        document.querySelectorAll('input[name="paymentMethod"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const method = this.value;

                // Hide all payment sections
                document.querySelectorAll('.payment-section').forEach(section => {
                    section.style.display = 'none';
                });

                // Show selected section
                if (method === 'creditCard') {
                    document.getElementById('creditCardSection').style.display = 'block';
                } else if (method === 'paypal') {
                    // PayPal section would be shown here
                }
            });
        });

        // Form validation
        document.getElementById('paymentForm').addEventListener('submit', function(e) {
            const terms = document.getElementById('terms');
            if (!terms.checked) {
                e.preventDefault();
                alert('Veuillez accepter les conditions générales de vente.');
                terms.focus();
            }
        });
    </script>
</body>
</html>