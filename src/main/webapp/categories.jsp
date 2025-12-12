<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catégories - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
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
        <h1 class="text-center mb-5">
            <i class="bi bi-folder"></i> Catégories de produits
        </h1>

        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="category-card text-center p-4 h-100">
                    <div class="category-icon display-1 mb-3 text-primary">
                        <i class="bi bi-phone"></i>
                    </div>
                    <h3>Électronique</h3>
                    <p class="text-muted">Smartphones, ordinateurs, accessoires tech</p>
                    <a href="${pageContext.request.contextPath}/products?category=1" class="btn btn-outline-primary mt-3">
                        Voir les produits
                    </a>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 mb-4">
                <div class="category-card text-center p-4 h-100">
                    <div class="category-icon display-1 mb-3 text-primary">
                        <i class="bi bi-tshirt"></i>
                    </div>
                    <h3>Vêtements</h3>
                    <p class="text-muted">Mode pour toute la famille</p>
                    <a href="${pageContext.request.contextPath}/products?category=2" class="btn btn-outline-primary mt-3">
                        Voir les produits
                    </a>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 mb-4">
                <div class="category-card text-center p-4 h-100">
                    <div class="category-icon display-1 mb-3 text-primary">
                        <i class="bi bi-book"></i>
                    </div>
                    <h3>Livres</h3>
                    <p class="text-muted">Romans, éducatifs, magazines</p>
                    <a href="${pageContext.request.contextPath}/products?category=3" class="btn btn-outline-primary mt-3">
                        Voir les produits
                    </a>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 mb-4">
                <div class="category-card text-center p-4 h-100">
                    <div class="category-icon display-1 mb-3 text-primary">
                        <i class="bi bi-house"></i>
                    </div>
                    <h3>Maison</h3>
                    <p class="text-muted">Meubles, décoration, électroménager</p>
                    <a href="${pageContext.request.contextPath}/products?category=4" class="btn btn-outline-primary mt-3">
                        Voir les produits
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>