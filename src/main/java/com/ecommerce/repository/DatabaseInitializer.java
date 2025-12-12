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

        // Add more users for testing
        User user2 = new User(3, "marie", "marie@email.com", "password123", "USER");
        StaticDatabase.addUser(user2);

        User user3 = new User(4, "jean", "jean@email.com", "password123", "USER");
        StaticDatabase.addUser(user3);

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

        // Initialize products with real image URLs from Unsplash

        // Électronique (Category 1)
        Product p1 = new Product(1, "iPhone 15 Pro",
                "Dernier iPhone avec écran Super Retina XDR et puce A17 Pro. Caméra 48MP avec zoom optique 5x.",
                1099.99, 1,
                "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&h=400&fit=crop",
                50);
        p1.setHasPromotion(true);
        p1.setDiscountPrice(769.99); // 30% off

        Product p2 = new Product(2, "MacBook Air M2",
                "Ordinateur portable Apple ultra-fin avec puce M2, écran Liquid Retina 13,6 pouces.",
                1199.99, 1,
                "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=600&h=400&fit=crop",
                30);
        p2.setHasPromotion(true);
        p2.setDiscountPrice(959.99); // 20% off

        Product p3 = new Product(3, "Samsung Galaxy S24",
                "Smartphone Android avec écran Dynamic AMOLED 2X 6,2 pouces, processeur Snapdragon 8 Gen 3.",
                899.99, 1,
                "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&h=400&fit=crop",
                40);

        Product p4 = new Product(4, "Casque Sony WH-1000XM5",
                "Casque audio sans fil avec réduction de bruit active et autonomie de 30 heures.",
                349.99, 1,
                "https://images.unsplash.com/photo-1484704849700-f032a568e944?w=600&h=400&fit=crop",
                25);

        Product p21 = new Product(21, "Apple Watch Series 9",
                "Montre connectée avec capteur ECG et oxymètre de pouls, écran Retina toujours activé.",
                429.99, 1,
                "https://images.unsplash.com/photo-1579586337278-3f6a89f8f4c4?w=600&h=400&fit=crop",
                35);

        Product p22 = new Product(22, "iPad Pro 12.9\"",
                "Tablette professionnelle avec écran Liquid Retina XDR et puce M2.",
                1299.99, 1,
                "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600&h=400&fit=crop",
                20);

        // Vêtements (Category 2)
        Product p5 = new Product(5, "T-shirt Blanc Premium",
                "T-shirt en coton bio de haute qualité, coupe classique, fait main en France.",
                24.99, 2,
                "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600&h=400&fit=crop",
                100);
        p5.setHasPromotion(true);
        p5.setDiscountPrice(19.99); // 20% off

        Product p6 = new Product(6, "Jean Slim Noir",
                "Jean décontracté coupe slim en denim stretch, confortable et élégant.",
                59.99, 2,
                "https://images.unsplash.com/photo-1544441893-675973e31985?w=600&h=400&fit=crop",
                75);

        Product p7 = new Product(7, "Pull en Laine Mérinos",
                "Pull chaud en laine mérinos 100% pour l'hiver, fabrication éthique.",
                79.99, 2,
                "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?w=600&h=400&fit=crop",
                60);

        Product p8 = new Product(8, "Robe d'Été en Lin",
                "Robe légère en lin naturel pour la saison estivale, coupe fluide.",
                44.99, 2,
                "https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=600&h=400&fit=crop",
                45);

        Product p23 = new Product(23, "Veste en Cuir",
                "Veste en cuir véritable, coupe classique, qualité premium.",
                199.99, 2,
                "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=600&h=400&fit=crop",
                25);
        p23.setHasPromotion(true);
        p23.setDiscountPrice(169.99); // 15% off

        Product p24 = new Product(24, "Chaussures de Sport",
                "Chaussures de running avec amorti amélioré, légères et respirantes.",
                89.99, 2,
                "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600&h=400&fit=crop",
                50);

        // Livres (Category 3)
        Product p9 = new Product(9, "Clean Code",
                "Manuel de programmation agile par Robert C. Martin. Guide pour écrire du code propre et maintenable.",
                39.99, 3,
                "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=600&h=400&fit=crop",
                80);
        p9.setHasPromotion(true);
        p9.setDiscountPrice(35.99); // 10% off

        Product p10 = new Product(10, "Design Patterns",
                "Les 23 modèles de conception essentiels par le Gang of Four.",
                49.99, 3,
                "https://images.unsplash.com/photo-1531346688376-ab6275c4725e?w=600&h=400&fit=crop",
                65);

        Product p11 = new Product(11, "Le Seigneur des Anneaux",
                "Trilogie fantasy de J.R.R. Tolkien, édition collector avec illustrations.",
                29.99, 3,
                "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=600&h=400&fit=crop",
                90);

        Product p12 = new Product(12, "Harry Potter Collection",
                "Les 7 romans de la saga Harry Potter, boîte collector.",
                119.99, 3,
                "https://images.unsplash.com/photo-1592496005605-ec0b5e1c8114?w=600&h=400&fit=crop",
                35);

        Product p25 = new Product(25, "Le Petit Prince",
                "Édition spéciale illustrée du chef-d'œuvre d'Antoine de Saint-Exupéry.",
                24.99, 3,
                "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600&h=400&fit=crop",
                120);
        p25.setHasPromotion(true);
        p25.setDiscountPrice(19.99); // 20% off

        Product p26 = new Product(26, "Biographie de Steve Jobs",
                "Biographie autorisée du co-fondateur d'Apple par Walter Isaacson.",
                34.99, 3,
                "https://images.unsplash.com/photo-1532012197267-da84d127e765?w=600&h=400&fit=crop",
                55);

        // Maison (Category 4)
        Product p13 = new Product(13, "Machine à Café Deluxe",
                "Machine à café automatique avec broyeur intégré, 19 bars de pression.",
                399.99, 4,
                "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600&h=400&fit=crop",
                20);

        Product p14 = new Product(14, "Table à Manger en Chêne",
                "Table extensible en chêne massif pour 6-8 personnes, fabrication artisanale.",
                799.99, 4,
                "https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?w=600&h=400&fit=crop",
                15);

        Product p15 = new Product(15, "Canapé 3 Places",
                "Canapé convertible en tissu velours, assise confortable mousse haute densité.",
                599.99, 4,
                "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=600&h=400&fit=crop",
                25);

        Product p16 = new Product(16, "Aspirateur Robot",
                "Aspirateur intelligent avec cartographie et contrôle vocal, autonomie 120 min.",
                299.99, 4,
                "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=400&fit=crop",
                30);

        Product p27 = new Product(27, "Lampe de Bureau Design",
                "Lampe LED ajustable avec technologie sans scintillement, design moderne.",
                89.99, 4,
                "https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=600&h=400&fit=crop",
                40);
        p27.setHasPromotion(true);
        p27.setDiscountPrice(71.99); // 20% off

        Product p28 = new Product(28, "Service à Thé en Porcelaine",
                "Service pour 6 personnes en porcelaine fine, motif élégant.",
                149.99, 4,
                "https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=600&h=400&fit=crop",
                30);

        // Sport (Category 5)
        Product p17 = new Product(17, "Vélo de Course",
                "Vélo de route en carbone T700 avec groupe Shimano 105, 22 vitesses.",
                1299.99, 5,
                "https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=600&h=400&fit=crop",
                10);

        Product p18 = new Product(18, "Tapis de Yoga Premium",
                "Tapis antidérapant épais 6mm avec sac de transport, matériaux écologiques.",
                34.99, 5,
                "https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?w=600&h=400&fit=crop",
                50);

        Product p29 = new Product(29, "Haltères Réglables",
                "Haltères réglables de 2.5kg à 25kg, système de changement rapide.",
                129.99, 5,
                "https://images.unsplash.com/photo-1534367507877-0edd93bd013b?w=600&h=400&fit=crop",
                35);

        Product p30 = new Product(30, "Ballon de Football",
                "Ballon officiel taille 5, matériau synthétique résistant.",
                29.99, 5,
                "https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=600&h=400&fit=crop",
                60);
        p30.setHasPromotion(true);
        p30.setDiscountPrice(23.99); // 20% off

        // Beauté (Category 6)
        Product p19 = new Product(19, "Parfum Signature",
                "Parfum eau de toilette 100ml - notes boisées et épicées, tenue longue durée.",
                89.99, 6,
                "https://images.unsplash.com/photo-1523293182086-7651a899d37f?w=600&h=400&fit=crop",
                40);

        Product p20 = new Product(20, "Kit Soins Visage",
                "Nettoyant, tonique et crème hydratante premium pour peau sensible.",
                59.99, 6,
                "https://images.unsplash.com/photo-1556228578-9c360e1d8d34?w=600&h=400&fit=crop",
                35);

        Product p31 = new Product(31, "Rouge à Lèvres Mat",
                "Rouge à lèvres mat longue tenue, 10 teintes disponibles, sans parabènes.",
                24.99, 6,
                "https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=600&h=400&fit=crop",
                80);

        Product p32 = new Product(32, "Masque Visuel Réparateur",
                "Masque aux extraits de caviar et collagène, effet anti-âge immédiat.",
                39.99, 6,
                "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=600&h=400&fit=crop",
                45);
        p32.setHasPromotion(true);
        p32.setDiscountPrice(31.99); // 20% off

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
        StaticDatabase.addProduct(p21);
        StaticDatabase.addProduct(p22);
        StaticDatabase.addProduct(p23);
        StaticDatabase.addProduct(p24);
        StaticDatabase.addProduct(p25);
        StaticDatabase.addProduct(p26);
        StaticDatabase.addProduct(p27);
        StaticDatabase.addProduct(p28);
        StaticDatabase.addProduct(p29);
        StaticDatabase.addProduct(p30);
        StaticDatabase.addProduct(p31);
        StaticDatabase.addProduct(p32);

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

        Promotion promo4 = new Promotion(4, "Noël en Avance",
                "Préparatifs de Noël : -15% sur les livres et la décoration",
                15, now, nextMonth);

        StaticDatabase.addPromotion(promo1);
        StaticDatabase.addPromotion(promo2);
        StaticDatabase.addPromotion(promo3);
        StaticDatabase.addPromotion(promo4);

        System.out.println("Database initialized with:");
        System.out.println("- " + StaticDatabase.getAllUsers().size() + " users");
        System.out.println("- " + StaticDatabase.getAllCategories().size() + " categories");
        System.out.println("- " + StaticDatabase.getAllProducts().size() + " products");
        System.out.println("- " + StaticDatabase.getAllPromotions().size() + " promotions");

        System.out.println("\nProducts by category:");
        System.out.println("- Électronique: " + StaticDatabase.getProductsByCategory(1).size() + " produits");
        System.out.println("- Vêtements: " + StaticDatabase.getProductsByCategory(2).size() + " produits");
        System.out.println("- Livres: " + StaticDatabase.getProductsByCategory(3).size() + " produits");
        System.out.println("- Maison: " + StaticDatabase.getProductsByCategory(4).size() + " produits");
        System.out.println("- Sport: " + StaticDatabase.getProductsByCategory(5).size() + " produits");
        System.out.println("- Beauté: " + StaticDatabase.getProductsByCategory(6).size() + " produits");
    }

    public static void main(String[] args) {
        // Test the database initialization
        initialize();

        System.out.println("\n=== Database Test ===");
        System.out.println("Total products: " + StaticDatabase.getAllProducts().size());
        System.out.println("First product: " + StaticDatabase.getAllProducts().get(0).getName());
        System.out.println("Image URL: " + StaticDatabase.getAllProducts().get(0).getImageUrl());
        System.out.println("Admin user: " + StaticDatabase.findUserByUsername("admin").getUsername());
        System.out.println("Active promotions: " + StaticDatabase.getActivePromotions().size());

        // Test cart functionality
        String testUser = "user1";
        Product testProduct = StaticDatabase.getProductById(1);
        StaticDatabase.addToCart(testUser, testProduct, 2);
        System.out.println("Cart total for " + testUser + ": " + StaticDatabase.getCartTotal(testUser) + "€");

        // Show some product images
        System.out.println("\n=== Sample Product Images ===");
        for (int i = 0; i < Math.min(5, StaticDatabase.getAllProducts().size()); i++) {
            Product p = StaticDatabase.getAllProducts().get(i);
            System.out.println(p.getName() + ": " + p.getImageUrl());
        }
    }
}