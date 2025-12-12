<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord Admin - Plateforme E-Commerce</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
        }
        .admin-content {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="admin-container">
        <!-- Admin Sidebar -->
        <aside class="admin-sidebar">
            <div class="admin-profile">
                <h3>Administrateur</h3>
                <p>${sessionScope.username}</p>
            </div>

            <nav class="admin-nav">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">
                    <i class="bi bi-speedometer2"></i> Tableau de bord
                </a>
                <a href="${pageContext.request.contextPath}/admin/products">
                    <i class="bi bi-box"></i> Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories">
                    <i class="bi bi-folder"></i> Catégories
                </a>
                <a href="${pageContext.request.contextPath}/admin/promotions">
                    <i class="bi bi-tag"></i> Promotions
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders">
                    <i class="bi bi-clipboard-check"></i> Commandes
                </a>
                <a href="${pageContext.request.contextPath}/admin/users">
                    <i class="bi bi-people"></i> Utilisateurs
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="logout">
                    <i class="bi bi-box-arrow-right"></i> Déconnexion
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="admin-content">
            <header class="admin-header">
                <h1>Tableau de bord Administrateur</h1>
                <p class="lead">Bienvenue, ${sessionScope.username}</p>
            </header>

            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #4caf50;">
                            <i class="bi bi-box"></i>
                        </div>
                        <div class="stat-info">
                            <h3>${productCount}</h3>
                            <p>Produits</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/products" class="stat-link">
                            Voir tous →
                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #2196f3;">
                            <i class="bi bi-folder"></i>
                        </div>
                        <div class="stat-info">
                            <h3>${categoryCount}</h3>
                            <p>Catégories</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/categories" class="stat-link">
                            Voir toutes →
                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #ff9800;">
                            <i class="bi bi-tag"></i>
                        </div>
                        <div class="stat-info">
                            <h3>${promotionCount}</h3>
                            <p>Promotions</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/promotions" class="stat-link">
                            Voir toutes →
                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #9c27b0;">
                            <i class="bi bi-cart-check"></i>
                        </div>
                        <div class="stat-info">
                            <h3>0</h3>
                            <p>Commandes aujourd'hui</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/orders" class="stat-link">
                            Voir →
                        </a>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="activity-section mb-4">
                <h2>Activité récente</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="bi bi-box"></i>
                        </div>
                        <div class="activity-content">
                            <p>Nouveau produit ajouté: "iPhone 15"</p>
                            <small class="text-muted">Il y a 2 heures</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="bi bi-person"></i>
                        </div>
                        <div class="activity-content">
                            <p>Nouvel utilisateur inscrit: "john_doe"</p>
                            <small class="text-muted">Il y a 4 heures</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="bi bi-tag"></i>
                        </div>
                        <div class="activity-content">
                            <p>Promotion créée: "Black Friday -30%"</p>
                            <small class="text-muted">Il y a 1 jour</small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="quick-actions">
                <h2>Actions rapides</h2>
                <div class="row">
                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="${pageContext.request.contextPath}/admin/products?action=add" class="action-card">
                            <div class="action-icon">
                                <i class="bi bi-plus-circle"></i>
                            </div>
                            <h3>Ajouter un produit</h3>
                            <p class="text-muted">Créer un nouveau produit</p>
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="${pageContext.request.contextPath}/admin/categories?action=add" class="action-card">
                            <div class="action-icon">
                                <i class="bi bi-folder-plus"></i>
                            </div>
                            <h3>Nouvelle catégorie</h3>
                            <p class="text-muted">Créer une catégorie</p>
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="${pageContext.request.contextPath}/admin/promotions?action=add" class="action-card">
                            <div class="action-icon">
                                <i class="bi bi-tag"></i>
                            </div>
                            <h3>Créer promotion</h3>
                            <p class="text-muted">Lancer une promotion</p>
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <a href="${pageContext.request.contextPath}/admin/orders" class="action-card">
                            <div class="action-icon">
                                <i class="bi bi-clipboard-check"></i>
                            </div>
                            <h3>Voir commandes</h3>
                            <p class="text-muted">Gérer les commandes</p>
                        </a>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>