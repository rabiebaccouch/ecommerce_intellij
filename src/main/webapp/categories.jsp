<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catégories - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<   link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <h1>📁 Catégories de produits</h1>

        <div class="categories-grid">
            <div class="category-card">
                <div class="category-icon">📱</div>
                <h3>Électronique</h3>
                <p>Smartphones, ordinateurs, accessoires tech</p>
                <a href="${pageContext.request.contextPath}/products?category=1" class="btn-secondary">
                    Voir les produits
                </a>
            </div>

            <div class="category-card">
                <div class="category-icon">👕</div>
                <h3>Vêtements</h3>
                <p>Mode pour toute la famille</p>
                <a href="${pageContext.request.contextPath}/products?category=2" class="btn-secondary">
                    Voir les produits
                </a>
            </div>

            <div class="category-card">
                <div class="category-icon">📚</div>
                <h3>Livres</h3>
                <p>Romans, éducatifs, magazines</p>
                <a href="${pageContext.request.contextPath}/products?category=3" class="btn-secondary">
                    Voir les produits
                </a>
            </div>

            <div class="category-card">
                <div class="category-icon">🏠</div>
                <h3>Maison</h3>
                <p>Meubles, décoration, électroménager</p>
                <a href="${pageContext.request.contextPath}/products?category=4" class="btn-secondary">
                    Voir les produits
                </a>
            </div>
        </div>
    </div>
</body>
</html>