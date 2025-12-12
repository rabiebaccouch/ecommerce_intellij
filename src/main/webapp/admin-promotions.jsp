<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Promotions - Admin</title>
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
        <aside class="admin-sidebar">
            <div class="admin-profile">
                <h3>Administrateur</h3>
                <p>${sessionScope.username}</p>
            </div>

            <nav class="admin-nav">
                <a href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="bi bi-speedometer2"></i> Tableau de bord
                </a>
                <a href="${pageContext.request.contextPath}/admin/products">
                    <i class="bi bi-box"></i> Produits
                </a>
                <a href="${pageContext.request.contextPath}/admin/categories">
                    <i class="bi bi-folder"></i> Catégories
                </a>
                <a href="${pageContext.request.contextPath}/admin/promotions" class="active">
                    <i class="bi bi-tag"></i> Promotions
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="logout">
                    <i class="bi bi-box-arrow-right"></i> Déconnexion
                </a>
            </nav>
        </aside>

        <main class="admin-content">
            <header class="admin-header">
                <h1>Gestion des promotions</h1>
                <button class="btn btn-primary" onclick="showPromotionForm()">
                    <i class="bi bi-plus-circle"></i> Nouvelle promotion
                </button>
            </header>

            <!-- Promotion Form -->
            <div class="admin-form" id="promotionForm" style="display: none;">
                <h2 id="promoFormTitle">Nouvelle promotion</h2>
                <form action="${pageContext.request.contextPath}/admin/promotions" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" id="promotionId">

                    <div class="mb-3">
                        <label for="promoName" class="form-label">Nom de la promotion *</label>
                        <input type="text" class="form-control" id="promoName" name="name" required>
                        <div class="invalid-feedback">
                            Veuillez saisir le nom de la promotion.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="promoDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="promoDescription" name="description" rows="3"></textarea>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="discount" class="form-label">Réduction (%) *</label>
                            <input type="number" class="form-control" id="discount" name="discount"
                                   min="1" max="100" step="1" required>
                            <div class="invalid-feedback">
                                Veuillez saisir la réduction (1-100%).
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="duration" class="form-label">Durée (jours)</label>
                            <select class="form-select" id="duration" name="duration">
                                <option value="7">1 semaine</option>
                                <option value="14">2 semaines</option>
                                <option value="30" selected>1 mois</option>
                                <option value="60">2 mois</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Appliquer à:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="applyToAll" id="applyToAll">
                            <label class="form-check-label" for="applyToAll">
                                Tous les produits
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="applyToCategory" id="applyToCategory">
                            <label class="form-check-label" for="applyToCategory">
                                Par catégorie
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="applyToSelected" id="applyToSelected">
                            <label class="form-check-label" for="applyToSelected">
                                Produits sélectionnés
                            </label>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="hidePromotionForm()">
                            Annuler
                        </button>
                        <button type="submit" class="btn btn-primary">
                            Créer promotion
                        </button>
                    </div>
                </form>
            </div>

            <!-- Promotions List -->
            <div class="row mt-4">
                <c:forEach var="promotion" items="${promotions}">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="promotion-card-admin ${promotion.active ? 'active' : 'expired'}">
                            <div class="promotion-header d-flex justify-content-between align-items-center">
                                <div class="promotion-badge">
                                    -${promotion.discountPercentage}%
                                </div>
                                <div class="promotion-actions">
                                    <button class="btn btn-warning btn-sm"
                                            onclick="editPromotion(${promotion.id})">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/promotion/delete/${promotion.id}"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Supprimer cette promotion?')">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="promotion-body">
                                <h3 class="h5">${promotion.name}</h3>
                                <p class="text-muted">${promotion.description}</p>

                                <div class="row mb-3">
                                    <div class="col-6">
                                        <div class="date-item">
                                            <span class="date-label">Début:</span>
                                            <span class="date-value">
                                                <fmt:formatDate value="${promotion.startDate}" pattern="dd/MM/yyyy"/>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="date-item">
                                            <span class="date-label">Fin:</span>
                                            <span class="date-value">
                                                <fmt:formatDate value="${promotion.endDate}" pattern="dd/MM/yyyy"/>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <div class="stat-item">
                                            <span class="stat-label">Statut:</span>
                                            <span class="stat-value ${promotion.active ? 'active' : 'expired'}">
                                                <span class="badge ${promotion.active ? 'bg-success' : 'bg-danger'}">
                                                    ${promotion.active ? 'Active' : 'Expirée'}
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="stat-item">
                                            <span class="stat-label">Produits:</span>
                                            <span class="stat-value badge bg-info">0</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="promotion-footer text-end">
                                <small>Créée le <fmt:formatDate value="${promotion.startDate}" pattern="dd/MM/yyyy"/></small>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Sample promotions if none exist -->
                <c:if test="${empty promotions}">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="promotion-card-admin active">
                            <div class="promotion-header">
                                <div class="promotion-badge">
                                    -20%
                                </div>
                            </div>
                            <div class="promotion-body">
                                <h3 class="h5">Black Friday</h3>
                                <p class="text-muted">Promotion spéciale Black Friday sur tous les produits électroniques</p>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <div class="date-item">
                                            <span class="date-label">Début:</span>
                                            <span class="date-value">24/11/2024</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="date-item">
                                            <span class="date-label">Fin:</span>
                                            <span class="date-value">30/11/2024</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="stat-item">
                                            <span class="stat-label">Statut:</span>
                                            <span class="stat-value active">
                                                <span class="badge bg-success">Active</span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="stat-item">
                                            <span class="stat-label">Produits:</span>
                                            <span class="stat-value badge bg-info">15</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="promotion-card-admin active">
                            <div class="promotion-header">
                                <div class="promotion-badge">
                                    -15%
                                </div>
                            </div>
                            <div class="promotion-body">
                                <h3 class="h5">Soldes d'été</h3>
                                <p class="text-muted">Réduction sur la collection vêtements d'été</p>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <div class="date-item">
                                            <span class="date-label">Début:</span>
                                            <span class="date-value">01/07/2024</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="date-item">
                                            <span class="date-label">Fin:</span>
                                            <span class="date-value">31/08/2024</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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