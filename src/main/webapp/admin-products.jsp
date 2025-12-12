<!-- In the table body section of admin-products.jsp -->
<tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>#${product.id}</td>
            <td>
                <!-- Admin product images based on product ID -->
                <c:choose>
                    <c:when test="${product.id == 1}">
                        <img src="https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=100&h=100&fit=crop"
                             alt="iPhone 15 Pro" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 2}">
                        <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=100&h=100&fit=crop"
                             alt="MacBook Air M2" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 3}">
                        <img src="https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=100&h=100&fit=crop"
                             alt="Samsung Galaxy S24" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 4}">
                        <img src="https://images.unsplash.com/photo-1484704849700-f032a568e944?w=100&h=100&fit=crop"
                             alt="Casque Sony" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 5}">
                        <img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=100&h=100&fit=crop"
                             alt="T-shirt Blanc" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 6}">
                        <img src="https://images.unsplash.com/photo-1544441893-675973e31985?w=100&h=100&fit=crop"
                             alt="Jean Slim" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 7}">
                        <img src="https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=100&h=100&fit=crop"
                             alt="Pull en Laine" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 8}">
                        <img src="https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=100&h=100&fit=crop"
                             alt="Robe d'Été" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 9}">
                        <img src="https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=100&h=100&fit=crop"
                             alt="Clean Code" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 10}">
                        <img src="https://images.unsplash.com/photo-1531346688376-ab6275c4725e?w=100&h=100&fit=crop"
                             alt="Design Patterns" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 11}">
                        <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=100&h=100&fit=crop"
                             alt="Le Seigneur des Anneaux" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 12}">
                        <img src="https://images.unsplash.com/photo-1592496005605-ec0b5e1c8114?w=100&h=100&fit=crop"
                             alt="Harry Potter" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 13}">
                        <img src="https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=100&h=100&fit=crop"
                             alt="Machine à Café" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 14}">
                        <img src="https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?w=100&h=100&fit=crop"
                             alt="Table à Manger" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 15}">
                        <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=100&h=100&fit=crop"
                             alt="Canapé 3 Places" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 16}">
                        <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=100&h=100&fit=crop"
                             alt="Aspirateur Robot" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 17}">
                        <img src="https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=100&h=100&fit=crop"
                             alt="Vélo de Course" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 18}">
                        <img src="https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?w=100&h=100&fit=crop"
                             alt="Tapis de Yoga" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 19}">
                        <img src="https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=100&h=100&fit=crop"
                             alt="Parfum Signature" class="img-thumbnail">
                    </c:when>
                    <c:when test="${product.id == 20}">
                        <img src="https://images.unsplash.com/photo-1556228578-9c360e1d8d34?w=100&h=100&fit=crop"
                             alt="Kit Soins Visage" class="img-thumbnail">
                    </c:when>
                    <c:otherwise>
                        <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=100&h=100&fit=crop"
                             alt="${product.name}" class="img-thumbnail">
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${product.name}</td>
            <td>
                <c:forEach var="category" items="${categories}">
                    <c:if test="${category.id == product.categoryId}">
                        ${category.name}
                    </c:if>
                </c:forEach>
            </td>
            <td>${product.price} €</td>
            <td>
                <span class="badge ${product.stock > 0 ? 'bg-success' : 'bg-danger'}">
                    ${product.stock}
                </span>
            </td>
            <td>
                <button class="btn btn-warning btn-sm"
                        onclick="editProduct(${product.id})">
                    <i class="bi bi-pencil"></i>
                </button>
                <a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Supprimer ce produit?')">
                    <i class="bi bi-trash"></i>
                </a>
            </td>
        </tr>
    </c:forEach>
</tbody>