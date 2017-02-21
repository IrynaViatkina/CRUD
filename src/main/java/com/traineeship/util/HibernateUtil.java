package com.traineeship.util;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public class HibernateUtil {
    @Autowired
    private SessionFactory sessionFactory;

    public <T> Serializable create(final T entity) {
        return sessionFactory.getCurrentSession().save(entity);
    }

    public <T> T update(final T entity) {
        sessionFactory.getCurrentSession().update(entity);
        return entity;
    }

    public <T> void delete(final T entity)
    {
        sessionFactory.getCurrentSession().delete(entity);
    }

    public <T> void delete(Serializable id, Class<T> entityClass)
    {
        T entity = takeById(id, entityClass);
        delete(entity);
    }

    public <T> List<T> takeAll(Class<T> entityClass)
    {
        return sessionFactory.getCurrentSession().createQuery(" FROM "+entityClass.getName()).list();
    }

    public <T> List takeAll(String query)
    {
        return sessionFactory.getCurrentSession().createSQLQuery(query).list();
    }

    public <T> T takeById(Serializable id, Class<T> entityClass)
    {
        return (T)sessionFactory.getCurrentSession().get(entityClass, id);
    }

    public SessionFactory getSessionFactory()
    {
        return sessionFactory;
    }
}
