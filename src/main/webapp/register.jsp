<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inscription - Plateforme E-Commerce</title>
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
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --shadow: 0 15px 35px rgba(50, 50, 93, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--primary-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }

        .auth-container {
            width: 100%;
            max-width: 450px;
        }

        .auth-card {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 40px;
            box-shadow: var(--shadow);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .auth-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2);
        }

        .create-account {
            margin-bottom: 30px;
        }

        .create-account h2 {
            color: #333;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .create-account p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }

        .form-group label .required {
            color: #f00;
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon input {
            width: 100%;
            padding: 12px 40px 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s;
            background: #f8f9fa;
        }

        .input-with-icon input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            background: #fff;
        }

        .input-with-icon .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            cursor: pointer;
        }

        .input-with-icon .bi {
            font-size: 18px;
        }

        .form-check {
            text-align: left;
            margin-bottom: 25px;
        }

        .form-check-input:checked {
            background-color: #667eea;
            border-color: #667eea;
        }

        .btn-signup {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-bottom: 25px;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
        }

        .auth-link {
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .auth-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }

        .auth-link a:hover {
            text-decoration: underline;
        }

        .alert {
            border-radius: 10px;
            border: none;
            padding: 12px 15px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .alert-danger {
            background: #fee;
            color: #c33;
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="create-account">
                <h2>Create Account</h2>
                <p>Join our community today!</p>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
                <div class="form-group">
                    <label for="username">Username <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <input type="text" id="username" name="username" required placeholder="Choose a username">
                        <div class="input-icon">
                            <i class="bi bi-person"></i>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email Address <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <input type="email" id="email" name="email" required placeholder="Enter your email">
                        <div class="input-icon">
                            <i class="bi bi-envelope"></i>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <input type="password" id="password" name="password" required placeholder="Create a password">
                        <div class="input-icon" id="togglePassword">
                            <i class="bi bi-eye"></i>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Repeat password">
                        <div class="input-icon" id="toggleConfirmPassword">
                            <i class="bi bi-eye"></i>
                        </div>
                    </div>
                </div>

                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="terms" name="terms" required>
                    <label class="form-check-label" for="terms">
                        I agree to the
                        <a href="#" style="color: #667eea; text-decoration: none;">terms and conditions</a>
                    </label>
                </div>

                <button type="submit" class="btn-signup">Sign Up</button>

                <div class="auth-link">
                    <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Password toggle functionality
        function setupPasswordToggle(inputId, toggleId) {
            const toggle = document.getElementById(toggleId);
            const input = document.getElementById(inputId);

            toggle.addEventListener('click', function() {
                const icon = this.querySelector('i');

                if (input.type === 'password') {
                    input.type = 'text';
                    icon.classList.remove('bi-eye');
                    icon.classList.add('bi-eye-slash');
                } else {
                    input.type = 'password';
                    icon.classList.remove('bi-eye-slash');
                    icon.classList.add('bi-eye');
                }
            });
        }

        // Setup password toggles
        setupPasswordToggle('password', 'togglePassword');
        setupPasswordToggle('confirmPassword', 'toggleConfirmPassword');

        // Form validation
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                document.getElementById('confirmPassword').focus();
                return;
            }

            if (!document.getElementById('terms').checked) {
                e.preventDefault();
                alert('You must accept the terms and conditions.');
                return;
            }

            // Additional validation can be added here
        });
    </script>
</body>
</html>