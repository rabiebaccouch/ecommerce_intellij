<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Promotions - Admin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="admin-container">
        <aside class="admin-sidebar">
            <div class="admin-profile">
                <h3>Administrateur</h3>
                <p>${sessionScope.username}</p>
            </div>

            <nav class="admin-nav">
                <a href="${pageContext.request.contextPath}/admin/dashboard">
                    📊 Tableau de bord
                </a>
                <a href="${pageContext.request.contextPath}/admin/products">
                    📦 Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories">
                    🗂️ Catégories
                </a>
                <a href="${pageContext.request.contextPath}/admin/promotions" class="active">
                    🏷️ Promotions
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="logout">
                    🚪 Déconnexion
                </a>
            </nav>
        </aside>

        <main class="admin-content">
            <header class="admin-header">
                <h1>Gestion des promotions</h1>
                <button class="btn-primary" onclick="showPromotionForm()">
                    + Nouvelle promotion
                </button>
            </header>

            <!-- Promotion Form -->
            <div class="admin-form" id="promotionForm" style="display: none;">
                <h2 id="promoFormTitle">Nouvelle promotion</h2>
                <form action="${pageContext.request.contextPath}/admin/promotions" method="post">
                    <input type="hidden" name="id" id="promotionId">

                    <div class="form-group">
                        <label for="promoName">Nom de la promotion *</label>
                        <input type="text" id="promoName" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="promoDescription">Description</label>
                        <textarea id="promoDescription" name="description" rows="3"></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="discount">Réduction (%) *</label>
                            <input type="number" id="discount" name="discount"
                                   min="1" max="100" step="1" required>
                        </div>

                        <div class="form-group">
                            <label for="duration">Durée (jours)</label>
                            <select id="duration" name="duration">
                                <option value="7">1 semaine</option>
                                <option value="14">2 semaines</option>
                                <option value="30" selected>1 mois</option>
                                <option value="60">2 mois</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Appliquer à:</label>
                        <div class="checkbox-group">
                            <label><input type="checkbox" name="applyToAll"> Tous les produits</label>
                            <label><input type="checkbox" name="applyToCategory"> Par catégorie</label>
                            <label><input type="checkbox" name="applyToSelected"> Produits sélectionnés</label>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-secondary" onclick="hidePromotionForm()">
                            Annuler
                        </button>
                        <button type="submit" class="btn-primary">
                            Créer promotion
                        </button>
                    </div>
                </form>
            </div>

            <!-- Promotions List -->
            <div class="promotions-grid">
                <c:forEach var="promotion" items="${promotions}">
                    <div class="promotion-card-admin ${promotion.active ? 'active' : 'expired'}">
                        <div class="promotion-header">
                            <div class="promotion-badge">
                                -${promotion.discountPercentage}%
                            </div>
                            <div class="promotion-actions">
                                <button class="btn-secondary btn-small"
                                        onclick="editPromotion(${promotion.id})">
                                    ✏️
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/promotion/delete/${promotion.id}"
                                   class="btn-danger btn-small"
                                   onclick="return confirm('Supprimer cette promotion?')">
                                    🗑️
                                </a>
                            </div>
                        </div>

                        <div class="promotion-body">
                            <h3>${promotion.name}</h3>
                            <p>${promotion.description}</p>

                            <div class="promotion-dates">
                                <div class="date-item">
                                    <span class="date-label">Début:</span>
                                    <span class="date-value">
                                        <fmt:formatDate value="${promotion.startDate}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </div>
                                <div class="date-item">
                                    <span class="date-label">Fin:</span>
                                    <span class="date-value">
                                        <fmt:formatDate value="${promotion.endDate}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </div>
                            </div>

                            <div class="promotion-stats">
                                <div class="stat-item">
                                    <span class="stat-label">Statut:</span>
                                    <span class="stat-value ${promotion.active ? 'active' : 'expired'}">
                                        ${promotion.active ? 'Active' : 'Expirée'}
                                    </span>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-label">Produits:</span>
                                    <span class="stat-value">0</span>
                                </div>
                            </div>
                        </div>

                        <div class="promotion-footer">
                            <small>Créée le <fmt:formatDate value="${promotion.startDate}" pattern="dd/MM/yyyy"/></small>
                        </div>
                    </div>
                </c:forEach>

                <!-- Sample promotions if none exist -->
                <c:if test="${empty promotions}">
                    <div class="promotion-card-admin active">
                        <div class="promotion-header">
                            <div class="promotion-badge">
                                -20%
                            </div>
                        </div>
                        <div class="promotion-body">
                            <h3>Black Friday</h3>
                            <p>Promotion spéciale Black Friday sur tous les produits électroniques</p>
                            <div class="promotion-dates">
                                <div class="date-item">
                                    <span class="date-label">Début:</span>
                                    <span class="date-value">24/11/2024</span>
                                </div>
                                <div class="date-item">
                                    <span class="date-label">Fin:</span>
                                    <span class="date-value">30/11/2024</span>
                                </div>
                            </div>
                            <div class="promotion-stats">
                                <div class="stat-item">
                                    <span class="stat-label">Statut:</span>
                                    <span class="stat-value active">Active</span>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-label">Produits:</span>
                                    <span class="stat-value">15</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="promotion-card-admin active">
                        <div class="promotion-header">
                            <div class="promotion-badge">
                                -15%
                            </div>
                        </div>
                        <div class="promotion-body">
                            <h3>Soldes d'été</h3>
                            <p>Réduction sur la collection vêtements d'été</p>
                            <div class="promotion-dates">
                                <div class="date-item">
                                    <span class="date-label">Début:</span>
                                    <span class="date-value">01/07/2024</span>
                                </div>
                                <div class="date-item">
                                    <span class="date-label">Fin:</span>
                                    <span class="date-value">31/08/2024</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>
    </div>

    <style>
        .promotions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .promotion-card-admin {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            overflow: hidden;
            border: 2px solid #e2e8f0;
        }

        .promotion-card-admin.active {
            border-color: #48bb78;
        }

        .promotion-card-admin.expired {
            border-color: #fed7d7;
            opacity: 0.7;
        }

        .promotion-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .promotion-badge {
            background: white;
            color: #667eea;
            font-size: 1.5rem;
            font-weight: bold;
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }

        .promotion-body {
            padding: 1.5rem;
        }

        .promotion-card-admin h3 {
            margin: 0 0 0.5rem 0;
            color: #2d3748;
        }

        .promotion-card-admin p {
            color: #718096;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }

        .promotion-dates {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .date-item {
            background: #f7fafc;
            padding: 0.8rem;
            border-radius: 5px;
        }

        .date-label {
            display: block;
            font-size: 0.8rem;
            color: #a0aec0;
            margin-bottom: 0.3rem;
        }

        .date-value {
            font-weight: 500;
            color: #2d3748;
        }

        .promotion-stats {
            display: flex;
            gap: 1rem;
        }

        .stat-item {
            flex: 1;
        }

        .stat-label {
            display: block;
            font-size: 0.8rem;
            color: #a0aec0;
        }

        .stat-value {
            font-weight: bold;
        }

        .stat-value.active {
            color: #38a169;
        }

        .stat-value.expired {
            color: #f56565;
        }

        .promotion-footer {
            padding: 1rem 1.5rem;
            background: #f7fafc;
            border-top: 1px solid #e2e8f0;
            text-align: right;
        }

        .promotion-footer small {
            color: #a0aec0;
        }

        .checkbox-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
    </style>

    <script>
        function showPromotionForm() {
            document.getElementById('promotionForm').style.display = 'block';
            document.getElementById('promotionId').value = '';
            document.getElementById('promoFormTitle').textContent = 'Nouvelle promotion';
        }

        function hidePromotionForm() {
            document.getElementById('promotionForm').style.display = 'none';
        }

        function editPromotion(id) {
            // In a real app, fetch promotion data via AJAX
            alert('Fonctionnalité d\'édition à implémenter avec AJAX');
            showPromotionForm();
        }
    </script>
</body>
</html>