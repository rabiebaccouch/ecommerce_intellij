package com.ecommerce.repository;

import com.ecommerce.model.*;
import java.util.*;

public class DatabaseInitializer {

    public static void initialize() {
        // Check if already initialized
        if (!StaticDatabase.getAllUsers().isEmpty()) {
            return; // Already initialized
        }

        System.out.println("Initializing database with sample data...");

        // Initialize admin user
        User admin = new User(1, "admin", "admin@ecommerce.com", "admin123", "ADMIN");
        StaticDatabase.addUser(admin);

        // Initialize regular user
        User user = new User(2, "user1", "user1@email.com", "password123", "USER");
        StaticDatabase.addUser(user);

        // Initialize categories
        Category cat1 = new Category(1, "Électronique",
                "Smartphones, ordinateurs, tablettes et accessoires électroniques");
        Category cat2 = new Category(2, "Vêtements",
                "Mode pour hommes, femmes et enfants");
        Category cat3 = new Category(3, "Livres",
                "Romans, livres éducatifs, magazines et bandes dessinées");
        Category cat4 = new Category(4, "Maison",
                "Meubles, décoration, électroménager et articles ménagers");
        Category cat5 = new Category(5, "Sport",
                "Équipements sportifs et vêtements de sport");
        Category cat6 = new Category(6, "Beauté",
                "Cosmétiques, soins de la peau et parfums");

        StaticDatabase.addCategory(cat1);
        StaticDatabase.addCategory(cat2);
        StaticDatabase.addCategory(cat3);
        StaticDatabase.addCategory(cat4);
        StaticDatabase.addCategory(cat5);
        StaticDatabase.addCategory(cat6);

        // Initialize products

        // Électronique
        Product p1 = new Product(1, "iPhone 15 Pro",
                "Dernier iPhone avec écran Super Retina XDR et puce A17 Pro. Caméra 48MP avec zoom optique 5x.",
                1099.99, 1, "iphone15.jpg", 50);
        p1.setHasPromotion(true);
        p1.setDiscountPrice(769.99); // 30% off

        Product p2 = new Product(2, "MacBook Air M2",
                "Ordinateur portable Apple ultra-fin avec puce M2, écran Liquid Retina 13,6 pouces.",
                1199.99, 1, "macbook-air.jpg", 30);
        p2.setHasPromotion(true);
        p2.setDiscountPrice(959.99); // 20% off

        Product p3 = new Product(3, "Samsung Galaxy S24",
                "Smartphone Android avec écran Dynamic AMOLED 2X 6,2 pouces, processeur Snapdragon 8 Gen 3.",
                899.99, 1, "samsung-s24.jpg", 40);

        Product p4 = new Product(4, "Casque Sony WH-1000XM5",
                "Casque audio sans fil avec réduction de bruit active et autonomie de 30 heures.",
                349.99, 1, "sony-headphones.jpg", 25);

        // Vêtements
        Product p5 = new Product(5, "T-shirt Blanc Premium",
                "T-shirt en coton bio de haute qualité, coupe classique, fait main en France.",
                24.99, 2, "tshirt-white.jpg", 100);
        p5.setHasPromotion(true);
        p5.setDiscountPrice(19.99); // 20% off

        Product p6 = new Product(6, "Jean Slim Noir",
                "Jean décontracté coupe slim en denim stretch, confortable et élégant.",
                59.99, 2, "jean-black.jpg", 75);

        Product p7 = new Product(7, "Pull en Laine Mérinos",
                "Pull chaud en laine mérinos 100% pour l'hiver, fabrication éthique.",
                79.99, 2, "wool-sweater.jpg", 60);

        Product p8 = new Product(8, "Robe d'Été en Lin",
                "Robe légère en lin naturel pour la saison estivale, coupe fluide.",
                44.99, 2, "summer-dress.jpg", 45);

        // Livres
        Product p9 = new Product(9, "Clean Code",
                "Manuel de programmation agile par Robert C. Martin. Guide pour écrire du code propre et maintenable.",
                39.99, 3, "clean-code.jpg", 80);
        p9.setHasPromotion(true);
        p9.setDiscountPrice(35.99); // 10% off

        Product p10 = new Product(10, "Design Patterns",
                "Les 23 modèles de conception essentiels par le Gang of Four.",
                49.99, 3, "design-patterns.jpg", 65);

        Product p11 = new Product(11, "Le Seigneur des Anneaux",
                "Trilogie fantasy de J.R.R. Tolkien, édition collector avec illustrations.",
                29.99, 3, "lotr.jpg", 90);

        Product p12 = new Product(12, "Harry Potter Collection",
                "Les 7 romans de la saga Harry Potter, boîte collector.",
                119.99, 3, "harry-potter.jpg", 35);

        // Maison
        Product p13 = new Product(13, "Machine à Café Deluxe",
                "Machine à café automatique avec broyeur intégré, 19 bars de pression.",
                399.99, 4, "coffee-machine.jpg", 20);

        Product p14 = new Product(14, "Table à Manger en Chêne",
                "Table extensible en chêne massif pour 6-8 personnes, fabrication artisanale.",
                799.99, 4, "dining-table.jpg", 15);

        Product p15 = new Product(15, "Canapé 3 Places",
                "Canapé convertible en tissu velours, assise confortable mousse haute densité.",
                599.99, 4, "sofa.jpg", 25);

        Product p16 = new Product(16, "Aspirateur Robot",
                "Aspirateur intelligent avec cartographie et contrôle vocal, autonomie 120 min.",
                299.99, 4, "robot-vacuum.jpg", 30);

        // Sport
        Product p17 = new Product(17, "Vélo de Course",
                "Vélo de route en carbone T700 avec groupe Shimano 105, 22 vitesses.",
                1299.99, 5, "road-bike.jpg", 10);

        Product p18 = new Product(18, "Tapis de Yoga Premium",
                "Tapis antidérapant épais 6mm avec sac de transport, matériaux écologiques.",
                34.99, 5, "yoga-mat.jpg", 50);

        // Beauté
        Product p19 = new Product(19, "Parfum Signature",
                "Parfum eau de toilette 100ml - notes boisées et épicées, tenue longue durée.",
                89.99, 6, "perfume.jpg", 40);

        Product p20 = new Product(20, "Kit Soins Visage",
                "Nettoyant, tonique et crème hydratante premium pour peau sensible.",
                59.99, 6, "skincare-kit.jpg", 35);

        // Add all products
        StaticDatabase.addProduct(p1);
        StaticDatabase.addProduct(p2);
        StaticDatabase.addProduct(p3);
        StaticDatabase.addProduct(p4);
        StaticDatabase.addProduct(p5);
        StaticDatabase.addProduct(p6);
        StaticDatabase.addProduct(p7);
        StaticDatabase.addProduct(p8);
        StaticDatabase.addProduct(p9);
        StaticDatabase.addProduct(p10);
        StaticDatabase.addProduct(p11);
        StaticDatabase.addProduct(p12);
        StaticDatabase.addProduct(p13);
        StaticDatabase.addProduct(p14);
        StaticDatabase.addProduct(p15);
        StaticDatabase.addProduct(p16);
        StaticDatabase.addProduct(p17);
        StaticDatabase.addProduct(p18);
        StaticDatabase.addProduct(p19);
        StaticDatabase.addProduct(p20);

        // Initialize promotions
        Date now = new Date();
        Date nextWeek = new Date(now.getTime() + (7L * 24 * 60 * 60 * 1000));
        Date nextMonth = new Date(now.getTime() + (30L * 24 * 60 * 60 * 1000));

        Promotion promo1 = new Promotion(1, "Black Friday",
                "Promotion exceptionnelle Black Friday sur une sélection de produits",
                30, now, nextWeek);

        Promotion promo2 = new Promotion(2, "Soldes d'Été",
                "Réductions sur la collection été - Vêtements et accessoires",
                20, now, nextMonth);

        Promotion promo3 = new Promotion(3, "Électronique -10%",
                "Promotion sur tous les produits électroniques pendant un mois",
                10, now, nextMonth);

        StaticDatabase.addPromotion(promo1);
        StaticDatabase.addPromotion(promo2);
        StaticDatabase.addPromotion(promo3);

        System.out.println("Database initialized with:");
        System.out.println("- " + StaticDatabase.getAllUsers().size() + " users");
        System.out.println("- " + StaticDatabase.getAllCategories().size() + " categories");
        System.out.println("- " + StaticDatabase.getAllProducts().size() + " products");
        System.out.println("- " + StaticDatabase.getAllPromotions().size() + " promotions");
    }

    public static void main(String[] args) {
        // Test the database initialization
        initialize();

        System.out.println("\n=== Database Test ===");
        System.out.println("First product: " + StaticDatabase.getAllProducts().get(0).getName());
        System.out.println("Admin user: " + StaticDatabase.findUserByUsername("admin").getUsername());
        System.out.println("Active promotions: " + StaticDatabase.getActivePromotions().size());

        // Test cart functionality
        String testUser = "user1";
        Product testProduct = StaticDatabase.getProductById(1);
        StaticDatabase.addToCart(testUser, testProduct, 2);
        System.out.println("Cart total for " + testUser + ": " + StaticDatabase.getCartTotal(testUser) + "€");
    }
}