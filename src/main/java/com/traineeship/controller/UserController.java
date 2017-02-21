package com.traineeship.controller;

import com.sun.istack.internal.logging.Logger;
import com.traineeship.entity.User;
import com.traineeship.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    private static final Logger logger = Logger.getLogger(UserController.class);

    public UserController() {
        System.out.println("UserController");
    }

    @Autowired
    private UserService userService;

    @RequestMapping("createUser")
    public ModelAndView createUser(@ModelAttribute User user) {
        logger.info("User was created. Date: " + user);
        return new ModelAndView("userForm");
    }

    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam long id, @ModelAttribute User user) {
        logger.info("User was updated. Id: " + id);
        user = userService.getUser(id);
        return new ModelAndView("userForm", "userObject", user);
    }

    @RequestMapping("saveUser")
    public ModelAndView saveUser(@ModelAttribute User user)
    {
        logger.info("User was saved. Data: " + user);
        if(user.getId() == 0)
            userService.createUser(user);
        else
            userService.updateUser(user);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam long id)
    {
        logger.info("User was deleted. Id: " + id);
        userService.deleteUser(id);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = {"/"})
    public ModelAndView getAllUsers()
    {
        logger.info("Getting all users.");
        List<User> userList = userService.getUsersByPage(0);
        Map<String, Object> model = new HashMap<String, Object>();
        long pages = userService.getRowsNumber() % 10 == 0 ? userService.getRowsNumber() / 10 - 1 : userService.getRowsNumber() / 10;
        model.put("userList", userList);
        model.put("noPages", pages);
        model.put("currentPage", 0);
        return new ModelAndView("usersList", "model", model);
    }

    @RequestMapping(value = {"getUsersByPage"})
    public ModelAndView getUsersByPage(@RequestParam long page)
    {
        logger.info("Getting all users by page.");
        List<User> userList = userService.getUsersByPage(page);
        Map<String, Object> model = new HashMap<String, Object>();
        long pages = userService.getRowsNumber()%10==0 ? userService.getRowsNumber()/10 -1 : userService.getRowsNumber()/10;
        model.put("userList", userList);
        model.put("noPages", pages);
        model.put("currentPage", page);
        return new ModelAndView("usersList", "model", model);
    }

    @RequestMapping("searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName)
    {
        if (searchName.isEmpty())
            return getAllUsers();
        logger.info("Searching the users. Names: " + searchName);
        List<User> userList = userService.getAllUsers(searchName);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("userList", userList);
        model.put("noPages", 0);
        model.put("currentPage", 0);
        return new ModelAndView("usersList", "model", model);
    }
}
