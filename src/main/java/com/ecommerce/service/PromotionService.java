package com.ecommerce.service;

import com.ecommerce.model.Promotion;
import com.ecommerce.repository.StaticDatabase;
import java.util.Date;
import java.util.List;

public class PromotionService {

    public List<Promotion> getAllPromotions() {
        return StaticDatabase.getAllPromotions();
    }

    public Promotion getPromotionById(int id) {
        return StaticDatabase.getPromotionById(id);
    }

    public void addPromotion(Promotion promotion) {
        StaticDatabase.addPromotion(promotion);
    }

    public void updatePromotion(Promotion promotion) {
        StaticDatabase.updatePromotion(promotion);
    }

    public void deletePromotion(int id) {
        StaticDatabase.deletePromotion(id);
    }

    public List<Promotion> getActivePromotions() {
        Date now = new Date();
        return StaticDatabase.getAllPromotions().stream()
                .filter(p -> p.isActive() &&
                        p.getStartDate().before(now) &&
                        p.getEndDate().after(now))
                .toList();
    }
}