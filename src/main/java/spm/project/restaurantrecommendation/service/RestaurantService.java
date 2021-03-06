package spm.project.restaurantrecommendation.service;

import spm.project.restaurantrecommendation.entity.Restaurant;

import java.util.List;

public interface RestaurantService {
    List<Restaurant> findAllRestaurants();

    Restaurant findById(Long id);

    List<Restaurant> findRestaurantByCategoryId(Long id);

    List<Restaurant> search (String keyword, String location);

    List<Restaurant> adminSearchRes (String keyword);
}
