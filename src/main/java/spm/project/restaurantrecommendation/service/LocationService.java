package spm.project.restaurantrecommendation.service;

import spm.project.restaurantrecommendation.entity.Location;

import java.util.List;


public interface LocationService {
    List<Location> findAll();

    Location findByDistrict(String district);

    Location findById(Long id);

    List<Location> findLocationByRestaurantId(Long id);
}
