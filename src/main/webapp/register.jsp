<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inscription - Plateforme E-Commerce</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/shared/navbar/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
</head>
<body>
    <jsp:include page="/shared/navbar/navbar.jsp"/>

    <div class="container">
        <div class="auth-container">
            <div class="auth-card">
                <h2>Créer un compte</h2>

                <c:if test="${not empty error}">
                    <div class="alert alert-error">
                        ${error}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/register" method="post">
                    <div class="form-group">
                        <label for="username">Nom d'utilisateur *</label>
                        <input type="text" id="username" name="username" required
                               placeholder="Choisissez un nom d'utilisateur">
                    </div>

                    <div class="form-group">
                        <label for="email">Adresse email *</label>
                        <input type="email" id="email" name="email" required
                               placeholder="Entrez votre email">
                    </div>

                    <div class="form-group">
                        <label for="password">Mot de passe *</label>
                        <input type="password" id="password" name="password" required
                               placeholder="Créez un mot de passe">
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirmer le mot de passe *</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required
                               placeholder="Répétez le mot de passe">
                    </div>

                    <div class="form-group">
                        <div class="form-check">
                            <input type="checkbox" id="terms" name="terms" required>
                            <label for="terms">
                                J'accepte les
                                <a href="#">conditions d'utilisation</a>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn-primary">S'inscrire</button>
                    </div>
                </form>

                <div class="auth-links">
                    <p>Déjà un compte?
                        <a href="${pageContext.request.contextPath}/login">Se connecter</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Password confirmation validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Les mots de passe ne correspondent pas!');
                document.getElementById('confirmPassword').focus();
            }
        });
    </script>
</body>
</html>