<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Produits - Plateforme E-Commerce</title>
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
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            margin: 20px auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        .product-item-wrapper {
            display: none;
        }
        .product-item-wrapper.active {
            display: block;
        }
        .page-item.disabled .page-link {
            cursor: not-allowed;
        }
        .page-info {
            text-align: center;
            margin-top: 10px;
            color: #666;
            font-size: 0.9rem;
        }

        /* ADD THESE STYLES FOR BUTTON CONSISTENCY */
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
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #2a5298, #1e3c72);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* Product card styling to match home.jsp */
        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
            background: white;
            height: 100%;
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
    </style>
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <div class="products-header mb-4">
            <h1 class="text-center mb-4">
                <c:choose>
                    <c:when test="${not empty category}">
                        ${category.name}
                    </c:when>
                    <c:when test="${not empty searchKeyword}">
                        Résultats pour: "${searchKeyword}"
                    </c:when>
                    <c:otherwise>
                        Tous les produits
                    </c:otherwise>
                </c:choose>
            </h1>

            <div class="products-tools mb-4">
                <div class="row">
                    <div class="col-md-8">
                        <form id="filter-form" action="${pageContext.request.contextPath}/products" method="get" class="row g-3">
                            <div class="col-md-6">
                                <select name="category" class="form-select" onchange="this.form.submit()">
                                    <option value="">Toutes les catégories</option>
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat.id}"
                                                <c:if test="${param.category == cat.id}">selected</c:if>>
                                            ${cat.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <select name="sort" id="sort-select" class="form-select">
                                    <option value="name" ${param.sort == 'name' || empty param.sort ? 'selected' : ''}>Trier par: Nom</option>
                                    <option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : ''}>Prix: Croissant</option>
                                    <option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : ''}>Prix: Décroissant</option>
                                    <option value="newest" ${param.sort == 'newest' ? 'selected' : ''}>Plus récents</option>
                                </select>
                            </div>
                            <c:if test="${not empty searchKeyword}">
                                <input type="hidden" name="search" value="${searchKeyword}">
                            </c:if>
                        </form>
                    </div>
                    <div class="col-md-4 text-end">
                        <div class="products-count h-100 d-flex align-items-center justify-content-end">
                            <span class="badge bg-primary fs-6">
                                <span id="total-products-count">${not empty products ? products.size() : 0}</span> produits trouvés
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty products and not empty products[0]}">
                <div class="row" id="products-container">
                    <c:forEach var="product" items="${products}" varStatus="status">
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4 product-item-wrapper"
                             data-product-index="${status.index}"
                             data-name="${product.name}"
                             data-price="${product.hasPromotion ? product.discountPrice : product.price}">
                            <div class="product-card h-100">
                                <div class="product-image">
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
                                        <c:when test="${product.id == 9}">
                                            <img src="https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=600&h=400&fit=crop"
                                                 alt="Clean Code" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 10}">
                                            <img src="https://images.unsplash.com/photo-1532012197267-da84d127e765?w=600&h=400&fit=crop"
                                                 alt="Design Patterns" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 11}">
                                            <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=600&h=400&fit=crop"
                                                 alt="Le Seigneur des Anneaux" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 12}">
                                            <img src="https://images.unsplash.com/photo-1541963463532-d68292c34b19?w=600&h=400&fit=crop"
                                                 alt="Harry Potter" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 13}">
                                            <img src="https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600&h=400&fit=crop"
                                                 alt="Machine à Café" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 14}">
                                            <img src="https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?w=600&h=400&fit=crop"
                                                 alt="Table à Manger" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 15}">
                                            <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=600&h=400&fit=crop"
                                                 alt="Canapé 3 Places" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 16}">
                                            <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=400&fit=crop"
                                                 alt="Aspirateur Robot" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 17}">
                                            <img src="https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=600&h=400&fit=crop"
                                                 alt="Vélo de Course" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 18}">
                                            <img src="https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?w=600&h=400&fit=crop"
                                                 alt="Tapis de Yoga" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 19}">
                                            <img src="https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=600&h=400&fit=crop"
                                                 alt="Parfum Signature" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 20}">
                                            <img src="https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=600&h=400&fit=crop"
                                                 alt="Kit Soins Visage" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 21}">
                                            <img src="https://images.unsplash.com/photo-1516733968668-dbdce39c4651?w=600&h=400&fit=crop"
                                                 alt="Apple Watch Series 9" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 22}">
                                            <img src="https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600&h=400&fit=crop"
                                                 alt="iPad Pro 12.9" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 23}">
                                            <img src="https://images.unsplash.com/photo-1551028719-00167b16eac5?w=600&h=400&fit=crop"
                                                 alt="Veste en Cuir" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 24}">
                                            <img src="https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600&h=400&fit=crop"
                                                 alt="Chaussures de Sport" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 25}">
                                            <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600&h=400&fit=crop"
                                                 alt="Le Petit Prince" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 26}">
                                            <img src="https://images.unsplash.com/photo-1532012197267-da84d127e765?w=600&h=400&fit=crop"
                                                 alt="Biographie de Steve Jobs" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 27}">
                                            <img src="https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=600&h=400&fit=crop"
                                                 alt="Lampe de Bureau Design" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 28}">
                                            <img src="https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=600&h=400&fit=crop"
                                                 alt="Service à Thé en Porcelaine" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 29}">
                                            <img src="https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=600&h=400&fit=crop"
                                                 alt="Haltères Réglables" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 30}">
                                            <img src="https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=600&h=400&fit=crop"
                                                 alt="Ballon de Football" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 31}">
                                            <img src="https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=600&h=400&fit=crop"
                                                 alt="Rouge à Lèvres Mat" class="img-fluid">
                                        </c:when>
                                        <c:when test="${product.id == 32}">
                                            <img src="https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=600&h=400&fit=crop"
                                                 alt="Masque Visuel Réparateur" class="img-fluid">
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
                                    <h3>${product.name}</h3>
                                    <p class="product-description">${product.description}</p>

                                    <div class="product-meta mb-2">
                                        <span class="category badge bg-secondary">
                                            <c:forEach var="cat" items="${categories}">
                                                <c:if test="${cat.id == product.categoryId}">
                                                    ${cat.name}
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                        <span class="stock badge ${product.stock > 0 ? 'bg-success' : 'bg-danger'}">
                                            ${product.stock > 0 ? 'En stock' : 'Rupture'}
                                        </span>
                                    </div>

                                    <div class="product-price mb-3">
                                        <c:choose>
                                            <c:when test="${product.hasPromotion}">
                                                <span class="old-price text-decoration-line-through text-muted">${product.price} €</span>
                                                <span class="new-price text-danger fw-bold">${product.discountPrice} €</span>
                                                <span class="discount badge bg-danger">
                                                    -<fmt:formatNumber value="${100 - (product.discountPrice * 100 / product.price)}" maxFractionDigits="0"/>%
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="price fw-bold text-primary">${product.price} €</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="product-actions d-grid gap-2">
                                        <a href="${pageContext.request.contextPath}/product/${product.id}"
                                           class="btn btn-outline-primary">Détails</a>

                                        <c:if test="${product.stock > 0}">
                                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                                <input type="hidden" name="productId" value="${product.id}">
                                                <input type="hidden" name="quantity" value="1">
                                                <button type="submit" class="btn btn-primary w-100">
                                                    Ajouter au panier
                                                </button>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination -->
                <nav aria-label="Page navigation" class="mt-4">
                    <ul class="pagination justify-content-center" id="pagination">
                        <!-- Pagination will be generated by JavaScript -->
                    </ul>
                </nav>

                <!-- Page info -->
                <div id="page-info" class="page-info"></div>
            </c:when>
            <c:otherwise>
                <div class="empty-state text-center py-5">
                    <i class="bi bi-search display-1 text-muted mb-4"></i>
                    <h3>Aucun produit trouvé</h3>
                    <p class="text-muted">Essayez de modifier vos critères de recherche</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary mt-3">
                        Voir tous les produits
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Pagination variables
        let currentPage = 1;
        const productsPerPage = 8;
        let totalProducts = 0;
        let totalPages = 0;

        // Main initialization
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize pagination
            initPagination();

            // Initialize sorting
            initSorting();

            // Check URL for sort parameter on page load
            checkUrlSortParameter();
        });

        // Pagination functions
        function initPagination() {
            const productWrappers = document.querySelectorAll('.product-item-wrapper');
            totalProducts = productWrappers.length;

            if (totalProducts === 0) return;

            totalPages = Math.ceil(totalProducts / productsPerPage);

            // Create pagination
            createPagination();

            // Show first page
            showPage(1);
        }

        function showPage(pageNum) {
            // Validate page number
            if (pageNum < 1) pageNum = 1;
            if (pageNum > totalPages) pageNum = totalPages;

            currentPage = pageNum;

            // Hide all products
            const productWrappers = document.querySelectorAll('.product-item-wrapper');
            productWrappers.forEach(wrapper => {
                wrapper.classList.remove('active');
            });

            // Calculate start and end indices
            const startIndex = (pageNum - 1) * productsPerPage;
            const endIndex = Math.min(startIndex + productsPerPage, totalProducts);

            // Show products for current page
            for (let i = startIndex; i < endIndex; i++) {
                if (productWrappers[i]) {
                    productWrappers[i].classList.add('active');
                }
            }

            // Update pagination UI
            updatePagination();
            updatePageInfo();
        }

        function createPagination() {
            const pagination = document.getElementById('pagination');
            if (!pagination) return;

            pagination.innerHTML = '';

            // Previous button
            const prevLi = document.createElement('li');
            prevLi.className = 'page-item';
            const prevLink = document.createElement('a');
            prevLink.className = 'page-link';
            prevLink.href = '#';
            prevLink.textContent = 'Précédent';
            prevLink.addEventListener('click', function(e) {
                e.preventDefault();
                if (currentPage > 1) {
                    showPage(currentPage - 1);
                }
            });
            prevLi.appendChild(prevLink);
            pagination.appendChild(prevLi);

            // Page numbers
            for (let i = 1; i <= totalPages; i++) {
                const pageLi = document.createElement('li');
                pageLi.className = 'page-item';
                const pageLink = document.createElement('a');
                pageLink.className = 'page-link';
                pageLink.href = '#';
                pageLink.textContent = i;
                pageLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    showPage(i);
                });
                pageLi.appendChild(pageLink);
                pagination.appendChild(pageLi);
            }

            // Next button
            const nextLi = document.createElement('li');
            nextLi.className = 'page-item';
            const nextLink = document.createElement('a');
            nextLink.className = 'page-link';
            nextLink.href = '#';
            nextLink.textContent = 'Suivant';
            nextLink.addEventListener('click', function(e) {
                e.preventDefault();
                if (currentPage < totalPages) {
                    showPage(currentPage + 1);
                }
            });
            nextLi.appendChild(nextLink);
            pagination.appendChild(nextLi);
        }

        function updatePagination() {
            const pagination = document.getElementById('pagination');
            if (!pagination) return;

            const pageItems = pagination.querySelectorAll('.page-item');

            // Reset all active and disabled states
            pageItems.forEach(item => {
                item.classList.remove('active');
                item.classList.remove('disabled');
            });

            // Update previous button
            if (currentPage === 1) {
                pageItems[0].classList.add('disabled');
            }

            // Update next button
            if (currentPage === totalPages) {
                pageItems[pageItems.length - 1].classList.add('disabled');
            }

            // Activate current page (skip first item which is "Précédent")
            if (pageItems[currentPage]) {
                pageItems[currentPage].classList.add('active');
            }
        }

        function updatePageInfo() {
            const pageInfo = document.getElementById('page-info');
            if (!pageInfo) return;

            const startProduct = (currentPage - 1) * productsPerPage + 1;
            const endProduct = Math.min(currentPage * productsPerPage, totalProducts);
            pageInfo.textContent = `Affichage des produits ${startProduct} à ${endProduct} sur ${totalProducts}`;
        }

        // Sorting functions
        function initSorting() {
            const sortSelect = document.getElementById('sort-select');
            if (!sortSelect) return;

            // Remove the default onchange that submits the form
            sortSelect.onchange = null;

            // Add our custom sorting handler
            sortSelect.addEventListener('change', function() {
                const sortValue = this.value;
                sortProductsClientSide(sortValue);
                updateUrlParameter('sort', sortValue);
            });
        }

        function sortProductsClientSide(sortType) {
            const container = document.getElementById('products-container');
            if (!container) return;

            const products = Array.from(container.querySelectorAll('.product-item-wrapper'));

            // Sort products based on sortType
            products.sort((a, b) => {
                switch(sortType) {
                    case 'name':
                        return a.dataset.name.localeCompare(b.dataset.name);
                    case 'price_asc':
                        return parseFloat(a.dataset.price) - parseFloat(b.dataset.price);
                    case 'price_desc':
                        return parseFloat(b.dataset.price) - parseFloat(a.dataset.price);
                    case 'newest':
                        // For newest, we'll sort by product ID (assuming higher ID = newer)
                        // You can change this if you have a date field
                        const idA = parseInt(a.querySelector('input[name="productId"]')?.value || a.dataset.productIndex);
                        const idB = parseInt(b.querySelector('input[name="productId"]')?.value || b.dataset.productIndex);
                        return idB - idA;
                    default:
                        return parseInt(a.dataset.productIndex) - parseInt(b.dataset.productIndex);
                }
            });

            // Reorder products in DOM
            products.forEach((product, index) => {
                product.dataset.productIndex = index;
                container.appendChild(product);
            });

            // Reset pagination
            totalProducts = products.length;
            totalPages = Math.ceil(totalProducts / productsPerPage);

            // Recreate pagination and show first page
            createPagination();
            showPage(1);
        }

        function checkUrlSortParameter() {
            const urlParams = new URLSearchParams(window.location.search);
            const sortParam = urlParams.get('sort');
            const sortSelect = document.getElementById('sort-select');

            if (sortParam && sortSelect) {
                // Set the select value
                sortSelect.value = sortParam;

                // Apply sorting
                setTimeout(() => {
                    sortProductsClientSide(sortParam);
                }, 100);
            }
        }

        function updateUrlParameter(key, value) {
            const url = new URL(window.location);
            url.searchParams.set(key, value);
            window.history.pushState({}, '', url);
        }
    </script>
</body>
</html>