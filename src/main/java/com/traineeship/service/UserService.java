package com.traineeship.service;

import com.traineeship.entity.User;

import java.util.List;

public interface UserService
{
    long createUser(User user);
    User updateUser(User user);
    void deleteUser(long id);
    List<User> getAllUser();
    User getUser(long id);
    List<User> getAllUsers(String userName);
    List<User> getUsersByPage(long page);
    long getRowsNumber();
}
