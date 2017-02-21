package com.traineeship.dao;

import com.traineeship.entity.User;
import com.traineeship.util.HibernateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao
{
    public UserDaoImpl()
    {
        System.out.println("UserDaoImpl");
    }

    @Autowired
    private HibernateUtil hibernateUtil;

    @Override
    public long createUser(User user)
    {
        return (Long) hibernateUtil.create(user);
    }

    @Override
    public User updateUser(User user)
    {
        return hibernateUtil.update(user);
    }

    @Override
    public void deleteUser(long id)
    {
        User user = new User();
        user.setId(id);
        hibernateUtil.delete(user);
    }

    @Override
    public List<User> getAllUsers()
    {
        return hibernateUtil.takeAll(User.class);
    }

    @Override
    public User getUser(long id)
    {
        return hibernateUtil.takeById(id, User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers(String userName)
    {
        String query = "SELECT e.* FROM user e WHERE e.name like '%" + userName + "%'";
        List<User> users = list(query);
        System.out.println(users);
        return users;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getUsersByPage(long page)
    {
        long displacement = 10 * page;
        long rows = 10;

        String query = "SELECT e.* FROM user e LIMIT " + displacement + ", " + rows;
        List<User> users = list(query);
        System.out.println(users);
        return users;
    }

    @Override
    public long getRowsNumber()
    {
        return ((Long)hibernateUtil.getSessionFactory().getCurrentSession().createQuery("select count(e) from User e").uniqueResult());
    }

    public List<User> list(String query)
    {
        List<Object[]> userObjects = (List<Object[]>) hibernateUtil.takeAll(query);
        List<User> users = new ArrayList<User>();

        for(Object[] userObject : userObjects)
        {
            User user = new User();
            long id = Long.parseLong(String.valueOf(userObject[0]));
            String name = (String) userObject[1];
            int age = (int) userObject[2];
            boolean isAdmin = false;
            if ((boolean)userObject[3])
                isAdmin = true;
            Date createdDate = (Date) userObject[4];
            user.setId(id);
            user.setName(name);
            user.setAge(age);
            user.setAdmin(isAdmin);
            user.setCreatedDate(createdDate);
            users.add(user);
        }
        return users;
    }
}
