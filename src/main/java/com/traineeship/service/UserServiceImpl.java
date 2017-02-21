package com.traineeship.service;

import com.traineeship.dao.UserDao;
import com.traineeship.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService
{
    public UserServiceImpl()
    {
        System.out.println("UserServiceImpl");
    }

    @Autowired
    private UserDao userDao;

    @Override
    public long createUser(User user)
    {
        return userDao.createUser(user);
    }

    @Override
    public User updateUser(User user)
    {
        return userDao.updateUser(user);
    }

    @Override
    public void deleteUser(long id)
    {
        userDao.deleteUser(id);
    }

    @Override
    public List<User> getAllUser()
    {
        return userDao.getAllUsers();
    }

    @Override
    public User getUser(long id)
    {
        return userDao.getUser(id);
    }

    @Override
    public List<User> getAllUsers(String userName)
    {
        return userDao.getAllUsers(userName);
    }

    @Override
    public List<User> getUsersByPage(long page)
    {
        return userDao.getUsersByPage(page);
    }

    @Override
    public long getRowsNumber()
    {
        return userDao.getRowsNumber();
    }
}
