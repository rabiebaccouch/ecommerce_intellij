<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Plateforme de Commerce Électronique - Accueil</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }
        .main-content {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin: 20px auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* Hero Section Styling */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        url('https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1600&h=600&fit=crop&q=80');
            background-size: cover;
            background-position: center;
            border-radius: 15px;
            padding: 60px 30px;
            margin-bottom: 40px;
            color: white;
            text-align: center;
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .hero-subtitle {
            font-size: 1.2rem;
            margin-bottom: 30px;
            opacity: 0.9;
        }

        .btn-hero {
            padding: 12px 30px;
            font-size: 1.1rem;
            border-radius: 50px;
            transition: transform 0.3s ease;
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border: none;
        }

        .btn-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            background: linear-gradient(45deg, #2a5298, #1e3c72);
        }

        /* Promotion Cards Styling */
        .promotion-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            border: none;
        }

        .promotion-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .promotion-image {
            height: 180px;
            width: 100%;
            object-fit: cover;
        }

        .discount-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 8px 15px;
            border-radius: 25px;
            font-weight: bold;
            font-size: 1.2rem;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
            z-index: 1;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .countdown-timer {
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 10px;
            border-radius: 10px;
            margin: 15px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .time-unit {
            text-align: center;
        }

        .time-value {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ff6b6b;
        }

        .time-label {
            font-size: 0.8rem;
            opacity: 0.8;
        }

        .promotion-content {
            padding: 20px;
        }

        .promotion-name {
            font-weight: 700;
            color: #2d3436;
            margin-bottom: 10px;
            font-size: 1.3rem;
        }

        .promotion-description {
            color: #636e72;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .promotion-date {
            color: #1e3c72;
            font-weight: 500;
        }

        .section-title {
            color: #2d3436;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
        }

        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border-radius: 2px;
        }

        /* Category Cards */
        .category-card {
            background: white;
            border-radius: 15px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: 2px solid transparent;
            height: 100%;
        }

        .category-card:hover {
            border-color: #1e3c72;
            transform: translateY(-5px);
        }

        .category-icon {
            font-size: 3rem;
            color: #1e3c72;
            margin-bottom: 20px;
        }

        .category-title {
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 10px;
        }

        .category-description {
            color: #636e72;
            font-size: 0.9rem;
            margin-bottom: 20px;
        }

        /* Product Cards */
        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
            background: white;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .product-image {
            position: relative;
            overflow: hidden;
            height: 200px;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .product-card:hover .product-image img {
            transform: scale(1.05);
        }

        .product-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.8rem;
            font-weight: bold;
        }

        .product-info {
            padding: 20px;
        }

        .product-title {
            font-weight: 600;
            color: #2d3436;
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .product-description {
            color: #636e72;
            font-size: 0.9rem;
            margin-bottom: 15px;
            height: 40px;
            overflow: hidden;
        }

        .product-price {
            margin-bottom: 15px;
        }

        .original-price {
            text-decoration: line-through;
            color: #b2bec3;
            margin-right: 10px;
        }

        .current-price {
            font-weight: bold;
            color: #1e3c72;
            font-size: 1.2rem;
        }

        .product-actions {
            display: flex;
            gap: 10px;
        }

        .btn-view, .btn-add {
            flex: 1;
            border-radius: 25px;
        }

        .btn-view {
            border-color: #1e3c72;
            color: #1e3c72;
        }

        .btn-view:hover {
            background: #1e3c72;
            color: white;
        }

        .btn-add {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border: none;
        }

        .btn-add:hover {
            background: linear-gradient(45deg, #2a5298, #1e3c72);
        }

        /* Footer */
        .footer {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px 0;
            margin-top: 40px;
            border-radius: 15px;
        }

        .btn-outline-primary {
            border-color: #1e3c72;
            color: #1e3c72;
        }

        .btn-outline-primary:hover {
            background: #1e3c72;
            border-color: #1e3c72;
            color: white;
        }

        .btn-primary {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #2a5298, #1e3c72);
        }
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <div class="main-content">
            <!-- Hero Section -->
            <section class="hero animate__animated animate__fadeIn">
                <div class="hero-container">
                    <h1 class="hero-title">Bienvenue sur notre Plateforme E-Commerce</h1>
                    <p class="hero-subtitle">Découvrez nos produits exclusifs avec des promotions exceptionnelles</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-hero animate__animated animate__pulse animate__infinite">
                        Voir les produits
                    </a>
                </div>
            </section>

            <!-- ONLY ONE Promotions Section - Animated with Countdown Timers -->
            <section class="promotion-section">
                <div class="container">
                    <h2 class="section-title animate__animated animate__fadeInUp">🔥 Promotions en cours</h2>
                    <div class="row">
                        <!-- Black Friday Promotion -->
                        <div class="col-md-6 col-lg-3 mb-4">
                            <div class="promotion-card animate__animated animate__fadeInUp animate__delay-1s">
                                <img src="https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=600&h=400&fit=crop"
                                     alt="Black Friday" class="promotion-image">
                                <div class="discount-badge animate__animated animate__heartBeat animate__infinite animate__slow">50%</div>
                                <div class="countdown-timer">
                                    <div class="time-unit">
                                        <div class="time-value" id="blackfriday-days">00</div>
                                        <div class="time-label">Jours</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="blackfriday-hours">00</div>
                                        <div class="time-label">Heures</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="blackfriday-minutes">00</div>
                                        <div class="time-label">Minutes</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="blackfriday-seconds">00</div>
                                        <div class="time-label">Secondes</div>
                                    </div>
                                </div>
                                <div class="promotion-content">
                                    <h3 class="promotion-name">Black Friday</h3>
                                    <p class="promotion-description">Promotion exceptionnelle Black Friday sur une sélection de produits</p>
                                    <small class="promotion-date">Valide jusqu'au: 19/12/2025</small>
                                </div>
                            </div>
                        </div>

                        <!-- Soldes d'Été Promotion -->
                        <div class="col-md-6 col-lg-3 mb-4">
                            <div class="promotion-card animate__animated animate__fadeInUp animate__delay-2s">
                                <img src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&h=400&fit=crop"
                                     alt="Soldes d'Été" class="promotion-image">
                                <div class="discount-badge" style="background: linear-gradient(45deg, #1dd1a1, #10ac84);">30%</div>
                                <div class="countdown-timer">
                                    <div class="time-unit">
                                        <div class="time-value" id="soldes-days">00</div>
                                        <div class="time-label">Jours</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="soldes-hours">00</div>
                                        <div class="time-label">Heures</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="soldes-minutes">00</div>
                                        <div class="time-label">Minutes</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="soldes-seconds">00</div>
                                        <div class="time-label">Secondes</div>
                                    </div>
                                </div>
                                <div class="promotion-content">
                                    <h3 class="promotion-name">Soldes d'Été</h3>
                                    <p class="promotion-description">Réductions sur la collection été - vêtements et accessoires</p>
                                    <small class="promotion-date">Valide jusqu'au: 11/01/2026</small>
                                </div>
                            </div>
                        </div>

                        <!-- Noël en Avance Promotion -->
                        <div class="col-md-6 col-lg-3 mb-4">
                            <div class="promotion-card animate__animated animate__fadeInUp animate__delay-3s">
                                <img src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=600&h=400&fit=crop"
                                     alt="Noël" class="promotion-image">
                                <div class="discount-badge" style="background: linear-gradient(45deg, #ff9ff3, #f368e0);">15%</div>
                                <div class="countdown-timer">
                                    <div class="time-unit">
                                        <div class="time-value" id="noel-days">00</div>
                                        <div class="time-label">Jours</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="noel-hours">00</div>
                                        <div class="time-label">Heures</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="noel-minutes">00</div>
                                        <div class="time-label">Minutes</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="noel-seconds">00</div>
                                        <div class="time-label">Secondes</div>
                                    </div>
                                </div>
                                <div class="promotion-content">
                                    <h3 class="promotion-name">Noël en Avance</h3>
                                    <p class="promotion-description">Préparatifs de Noël : -15% sur les livres et la décoration</p>
                                    <small class="promotion-date">Valide jusqu'au: 11/01/2026</small>
                                </div>
                            </div>
                        </div>

                        <!-- Électronique Promotion -->
                        <div class="col-md-6 col-lg-3 mb-4">
                            <div class="promotion-card animate__animated animate__fadeInUp animate__delay-4s">
                                <img src="https://images.unsplash.com/photo-1498049794561-7780e7231661?w=600&h=400&fit=crop"
                                     alt="Électronique" class="promotion-image">
                                <div class="discount-badge" style="background: linear-gradient(45deg, #54a0ff, #2e86de);">10%</div>
                                <div class="countdown-timer">
                                    <div class="time-unit">
                                        <div class="time-value" id="electronique-days">00</div>
                                        <div class="time-label">Jours</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="electronique-hours">00</div>
                                        <div class="time-label">Heures</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="electronique-minutes">00</div>
                                        <div class="time-label">Minutes</div>
                                    </div>
                                    <div class="time-unit">
                                        <div class="time-value" id="electronique-seconds">00</div>
                                        <div class="time-label">Secondes</div>
                                    </div>
                                </div>
                                <div class="promotion-content">
                                    <h3 class="promotion-name">Électronique -10%</h3>
                                    <p class="promotion-description">Promotion sur tous les produits électroniques pendant un mois</p>
                                    <small class="promotion-date">Valide jusqu'au: 11/01/2026</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Featured Products -->
            <section class="products-section">
                <div class="container">
                    <h2 class="section-title animate__animated animate__fadeInUp">🎯 Produits populaires</h2>
                    <div class="row">
                        <c:forEach var="product" items="${products}" end="7">
                            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                                <div class="product-card h-100 animate__animated animate__fadeIn">
                                    <div class="product-image">
                                        <!-- Unique images based on product ID -->
                                        <c:choose>
                                            <c:when test="${product.id == 1}">
                                                <img src="https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&h=400&fit=crop"
                                                     alt="iPhone 15 Pro" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 2}">
                                                <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=600&h=400&fit=crop"
                                                     alt="MacBook Air M2" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 3}">
                                                <img src="https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&h=400&fit=crop"
                                                     alt="Samsung Galaxy S24" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 4}">
                                                <img src="https://images.unsplash.com/photo-1484704849700-f032a568e944?w=600&h=400&fit=crop"
                                                     alt="Casque Sony" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 5}">
                                                <img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600&h=400&fit=crop"
                                                     alt="T-shirt Blanc" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 6}">
                                                <img src="https://images.unsplash.com/photo-1544441893-675973e31985?w=600&h=400&fit=crop"
                                                     alt="Jean Slim" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 7}">
                                                <img src="https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=600&h=400&fit=crop"
                                                     alt="Pull en Laine" class="img-fluid">
                                            </c:when>
                                            <c:when test="${product.id == 8}">
                                                <img src="https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=600&h=400&fit=crop"
                                                     alt="Robe d'Été" class="img-fluid">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=600&h=400&fit=crop"
                                                     alt="${product.name}" class="img-fluid">
                                            </c:otherwise>
                                        </c:choose>
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
                                               class="btn btn-outline-primary btn-sm btn-view">Voir détails</a>
                                            <c:if test="${product.stock > 0}">
                                                <form action="${pageContext.request.contextPath}/cart/add" method="post" class="add-to-cart-form d-inline">
                                                    <input type="hidden" name="productId" value="${product.id}">
                                                    <input type="hidden" name="quantity" value="1">
                                                    <button type="submit" class="btn btn-primary btn-sm btn-add">Ajouter</button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="text-center mt-4">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-lg animate__animated animate__pulse animate__infinite animate__slower">
                            Voir tous les produits
                        </a>
                    </div>
                </div>
            </section>

            <!-- Categories -->
            <section class="category-section">
                <div class="container">
                    <h2 class="section-title animate__animated animate__fadeInUp">📁 Catégories</h2>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="category-card animate__animated animate__fadeInLeft">
                                <div class="category-icon">
                                    <i class="bi bi-laptop"></i>
                                </div>
                                <div class="category-content">
                                    <h3 class="category-title">Électronique</h3>
                                    <p class="category-description">Smartphones, ordinateurs, tablettes</p>
                                    <a href="${pageContext.request.contextPath}/products?category=1" class="btn btn-outline-primary">
                                        Explorer →
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="category-card animate__animated animate__fadeInLeft animate__delay-1s">
                                <div class="category-icon">
                                    <i class="bi bi-tshirt"></i>
                                </div>
                                <div class="category-content">
                                    <h3 class="category-title">Vêtements</h3>
                                    <p class="category-description">Mode pour hommes, femmes, enfants</p>
                                    <a href="${pageContext.request.contextPath}/products?category=2" class="btn btn-outline-primary">
                                        Explorer →
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="category-card animate__animated animate__fadeInLeft animate__delay-2s">
                                <div class="category-icon">
                                    <i class="bi bi-book"></i>
                                </div>
                                <div class="category-content">
                                    <h3 class="category-title">Livres</h3>
                                    <p class="category-description">Romans, éducatifs, magazines</p>
                                    <a href="${pageContext.request.contextPath}/products?category=3" class="btn btn-outline-primary">
                                        Explorer →
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="category-card animate__animated animate__fadeInLeft animate__delay-3s">
                                <div class="category-icon">
                                    <i class="bi bi-house"></i>
                                </div>
                                <div class="category-content">
                                    <h3 class="category-title">Maison</h3>
                                    <p class="category-description">Meubles, décoration, électroménager</p>
                                    <a href="${pageContext.request.contextPath}/products?category=4" class="btn btn-outline-primary">
                                        Explorer →
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <footer class="footer mt-5 animate__animated animate__fadeInUp">
        <div class="container">
            <div class="footer-content">
                <p class="text-center">&copy; 2024 Plateforme de Commerce Électronique. Tous droits réservés.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Countdown Timer Script -->
    <script>
        console.log("Countdown timer script loaded successfully!");

        // Set end dates for each promotion
        const promotionEndDates = {
            'blackfriday': new Date('2025-12-19T23:59:59').getTime(),
            'soldes': new Date('2026-01-11T23:59:59').getTime(),
            'noel': new Date('2026-01-11T23:59:59').getTime(),
            'electronique': new Date('2026-01-11T23:59:59').getTime()
        };

        // Function to pad numbers with leading zero
        function padNumber(num) {
            return num < 10 ? '0' + num : num.toString();
        }

        // Function to update a single countdown timer
        function updateCountdownTimer(promotionName) {
            // Get current time
            const now = new Date().getTime();

            // Get end time for this promotion
            const endTime = promotionEndDates[promotionName];

            // Calculate time remaining
            const timeRemaining = endTime - now;

            // Get DOM elements
            const daysElement = document.getElementById(promotionName + '-days');
            const hoursElement = document.getElementById(promotionName + '-hours');
            const minutesElement = document.getElementById(promotionName + '-minutes');
            const secondsElement = document.getElementById(promotionName + '-seconds');

            // Check if elements exist
            if (!daysElement || !hoursElement || !minutesElement || !secondsElement) {
                console.log(`Elements for ${promotionName} not found yet, will try again...`);
                return;
            }

            // If time has expired, set all to 00
            if (timeRemaining < 0) {
                daysElement.textContent = '00';
                hoursElement.textContent = '00';
                minutesElement.textContent = '00';
                secondsElement.textContent = '00';
                return;
            }

            // Calculate days, hours, minutes, seconds
            const days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));
            const hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

            // Update the display
            daysElement.textContent = padNumber(days);
            hoursElement.textContent = padNumber(hours);
            minutesElement.textContent = padNumber(minutes);
            secondsElement.textContent = padNumber(seconds);

            // Add animation to seconds
            secondsElement.classList.add('animate__animated', 'animate__pulse');
            setTimeout(() => {
                secondsElement.classList.remove('animate__animated', 'animate__pulse');
            }, 500);
        }

        // Function to update all countdown timers
        function updateAllCountdowns() {
            updateCountdownTimer('blackfriday');
            updateCountdownTimer('soldes');
            updateCountdownTimer('noel');
            updateCountdownTimer('electronique');
        }

        // Initialize when the page loads
        document.addEventListener('DOMContentLoaded', function() {
            console.log("DOM fully loaded and parsed");

            // Wait a bit to ensure all elements are rendered
            setTimeout(() => {
                // Initial update
                updateAllCountdowns();

                // Update every second
                setInterval(updateAllCountdowns, 1000);

                console.log("Countdown timers started successfully!");
            }, 500);

            // Add hover animations to promotion cards
            const promotionCards = document.querySelectorAll('.promotion-card');
            promotionCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.classList.add('animate__animated', 'animate__pulse');
                });
                card.addEventListener('mouseleave', function() {
                    this.classList.remove('animate__animated', 'animate__pulse');
                });
            });

            // Add click animation to hero button
            const heroButton = document.querySelector('.btn-hero');
            if (heroButton) {
                heroButton.addEventListener('click', function(e) {
                    this.classList.add('animate__animated', 'animate__rubberBand');
                    setTimeout(() => {
                        this.classList.remove('animate__animated', 'animate__rubberBand');
                    }, 1000);
                });
            }
        });

        // Fallback: Start timers if DOM is already loaded
        if (document.readyState === 'complete' || document.readyState === 'interactive') {
            console.log("Document already ready, starting timers...");
            setTimeout(() => {
                updateAllCountdowns();
                setInterval(updateAllCountdowns, 1000);
            }, 1000);
        }
    </script>
</body>
</html>