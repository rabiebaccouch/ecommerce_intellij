<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord Admin - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
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
                    📊 Tableau de bord
                </a>
                <a href="${pageContext.request.contextPath}/admin/products">
                    📦 Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories">
                    🗂️ Catégories
                </a>
                <a href="${pageContext.request.contextPath}/admin/promotions">
                    🏷️ Promotions
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders">
                    📋 Commandes
                </a>
                <a href="${pageContext.request.contextPath}/admin/users">
                    👥 Utilisateurs
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="logout">
                    🚪 Déconnexion
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="admin-content">
            <header class="admin-header">
                <h1>Tableau de bord Administrateur</h1>
                <p>Bienvenue, ${sessionScope.username}</p>
            </header>

            <!-- Stats Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon" style="background: #4caf50;">📦</div>
                    <div class="stat-info">
                        <h3>${productCount}</h3>
                        <p>Produits</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/products" class="stat-link">
                        Voir tous →
                    </a>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: #2196f3;">🗂️</div>
                    <div class="stat-info">
                        <h3>${categoryCount}</h3>
                        <p>Catégories</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/categories" class="stat-link">
                        Voir toutes →
                    </a>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: #ff9800;">🏷️</div>
                    <div class="stat-info">
                        <h3>${promotionCount}</h3>
                        <p>Promotions</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/promotions" class="stat-link">
                        Voir toutes →
                    </a>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: #9c27b0;">💰</div>
                    <div class="stat-info">
                        <h3>0</h3>
                        <p>Commandes aujourd'hui</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/orders" class="stat-link">
                        Voir →
                    </a>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="activity-section">
                <h2>Activité récente</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">📦</div>
                        <div class="activity-content">
                            <p>Nouveau produit ajouté: "iPhone 15"</p>
                            <small>Il y a 2 heures</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">👤</div>
                        <div class="activity-content">
                            <p>Nouvel utilisateur inscrit: "john_doe"</p>
                            <small>Il y a 4 heures</small>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">🏷️</div>
                        <div class="activity-content">
                            <p>Promotion créée: "Black Friday -30%"</p>
                            <small>Il y a 1 jour</small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="quick-actions">
                <h2>Actions rapides</h2>
                <div class="actions-grid">
                    <a href="${pageContext.request.contextPath}/admin/products?action=add" class="action-card">
                        <div class="action-icon">➕</div>
                        <h3>Ajouter un produit</h3>
                        <p>Créer un nouveau produit</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/categories?action=add" class="action-card">
                        <div class="action-icon">🗂️</div>
                        <h3>Nouvelle catégorie</h3>
                        <p>Créer une catégorie</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/promotions?action=add" class="action-card">
                        <div class="action-icon">🏷️</div>
                        <h3>Créer promotion</h3>
                        <p>Lancer une promotion</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/orders" class="action-card">
                        <div class="action-icon">📋</div>
                        <h3>Voir commandes</h3>
                        <p>Gérer les commandes</p>
                    </a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>