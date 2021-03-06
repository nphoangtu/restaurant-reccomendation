package spm.project.restaurantrecommendation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import spm.project.restaurantrecommendation.dto.ReservationDetailDto;
import spm.project.restaurantrecommendation.entity.Mail;
import spm.project.restaurantrecommendation.entity.ReservationDetail;
import spm.project.restaurantrecommendation.entity.Restaurant;
import spm.project.restaurantrecommendation.entity.User;
import spm.project.restaurantrecommendation.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.*;


@Controller
public class RestaurantController {

    @Autowired
    private EmailService emailService;

    @Autowired
    private LocationService locationService;

    @Autowired
    private RestaurantService restaurantService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ReservationDetailService reservationDetailService;

    @ModelAttribute("reservation")
    public ReservationDetailDto reservationDetailDto() {
        return new ReservationDetailDto();
    }


    @PreAuthorize("!(hasRole('USER') OR hasRole('ADMIN'))")
    @GetMapping("/restaurant/{id}")
    public String showRestaurantDetail(@PathVariable("id") Long id,
                                       Model model, ModelMap map, Authentication authentication, Principal principal, User user) {
        if (authentication != null) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            List<String> roles = new ArrayList<String>();
            for (GrantedAuthority a : authorities) {
                roles.add(a.getAuthority());
            }
            if (isUser(roles)) {
                map.addAttribute("navbar", "navbar-authenticated");
            } else {
                map.addAttribute("navbar", "navbar");
            }
        }
        List<Restaurant> restaurants = restaurantService.findAllRestaurants();
        Restaurant restaurant = restaurantService.findById(id);
        // System.out.println(categoryService.findCategoryByIdRestaurant(id).stream().map(Category::getCategoryName).collect(Collectors.toList()) + ",");

        model.addAttribute("restaurants", restaurants);
        model.addAttribute("restaurant", restaurant);

        return "restaurant";
    }

    private String date = "";
    private String time = "";
    private String size = "";

    // reservation page
    @PreAuthorize("!(hasRole('USER'))")
    @GetMapping("/restaurant/{id}/reservation")
    public String showReservationPage(@PathVariable("id") Long id, HttpServletRequest request, @AuthenticationPrincipal User user,
            Authentication authentication, Principal principal, ModelMap map, Model model) {
        if (principal == null) {
            return ("redirect:/login");
        }

        if (authentication != null) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            List<String> roles = new ArrayList<String>();
            for (GrantedAuthority a : authorities) {
                roles.add(a.getAuthority());
            }
            if (isUser(roles)) {
                map.addAttribute("navbar", "navbar-authenticated");
            }
            else {
                map.addAttribute("navbar", "navbar");
            }
        }

        this.date = request.getParameter("date");
        this.time = request.getParameter("time");
        this.size = request.getParameter("size");
        Restaurant restaurant = restaurantService.findById(id);
        model.addAttribute("restaurant", restaurant);
        return "reservation";
    }

    @PreAuthorize("!(hasRole('USER') OR hasRole('ADMIN'))")
    @PostMapping("/restaurant/{id}/reservation")
    public String reserveTable(@PathVariable("id") Long id, Authentication authentication, Principal principal,
                               @ModelAttribute("reservation") @Valid ReservationDetailDto reservationDetailDto,
                               BindingResult result, ModelMap map, Model model, HttpServletRequest request) {
        if (authentication != null) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            List<String> roles = new ArrayList<String>();
            for (GrantedAuthority a : authorities) {
                roles.add(a.getAuthority());
            }
            if (isUser(roles)) {
                map.addAttribute("navbar", "navbar-authenticated");
            }
            else {
                map.addAttribute("navbar", "navbar");
            }
        }

        Restaurant restaurant = restaurantService.findById(id);

        reservationDetailDto.setDate(this.date);
        reservationDetailDto.setTime(this.time);
        reservationDetailDto.setNumOfPeople(Integer.parseInt(this.size));

        model.addAttribute("reservation", reservationDetailDto);
        model.addAttribute("restaurant", restaurant);
        if (result.hasErrors()) {
            return "reservation";
        }
        reservationDetailService.save(reservationDetailDto,restaurant);

        ReservationDetail savedReservation = reservationDetailService.findByEmail(reservationDetailDto.getEmail());

        if( savedReservation == null) {
            result.rejectValue("email","We could not find an account for that e-mail address");
            return "/restaurant/" + restaurant.getId() + "/reservation";
        }

        Mail mail = new Mail();
        mail.setFrom("practice.project.noreply@gmail.com");
        mail.setTo(savedReservation.getEmail());
        mail.setSubject("RESERVATION SUCCESSFUL");

        Map<String, Object> mailModel = new HashMap<>();
        mailModel.put("reservation", savedReservation);
        mailModel.put("restaurant", restaurant);
        mailModel.put("signature","THE FIFTH ORANGE ORGANIZATION - Together we make differences");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        //mailModel.put("registrationUrl",url + "/registration?=" + savedReservation.getUsername());
        mail.setModel(mailModel);
        emailService.sendEmail(mail, "email/email-confirmReservation");
        return "redirect:/restaurant/" + restaurant.getId() + "/reservation?success";
    }

    private boolean isUser(List<String> roles) {
        if (roles.contains("USER")) {
            return true;
        }
        return false;
    }
}
