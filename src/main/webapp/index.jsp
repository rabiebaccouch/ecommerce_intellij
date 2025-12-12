<!DOCTYPE html>
<html>
<title>IIT/GR3 - Plateforme E-Commerce</title>
<head>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }
        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 20px;
            display: block;
            border: 3px solid #6a11cb;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="text-center mb-4">
            <img src="assets/img/avatar.png" alt="Avatar" class="avatar">
            <h2 class="h3">Connexion</h2>
        </div>

        <form action="/login" method="post">
            <div class="mb-3">
                <label for="uname" class="form-label"><b>Username</b></label>
                <input type="text" class="form-control form-control-lg" placeholder="Enter Username" name="uname" required>
            </div>

            <div class="mb-3">
                <label for="psw" class="form-label"><b>Password</b></label>
                <input type="password" class="form-control form-control-lg" placeholder="Enter Password" name="psw" required>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" checked="checked" name="remember">
                <label class="form-check-label">Remember me</label>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">Login</button>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">Retour à l'accueil</a>
            </div>

            <div class="text-center mt-3">
                <span class="psw">
                    Forgot <a href="#">password?</a>
                </span>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>