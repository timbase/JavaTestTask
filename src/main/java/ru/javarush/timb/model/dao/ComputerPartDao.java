package ru.javarush.timb.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ru.javarush.timb.model.entity.Part;

import java.util.List;


@Repository
public class ComputerPartDao implements PartDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addPart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(part);
    }

    @Override
    public void updatePart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part.toString(), part);
    }

    @Override
    public void removePart(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = session.get(Part.class, id);

        if (part != null) {
            session.delete(part);
        }
    }

    @Override
    public Part getPartById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = session.get(Part.class, id);
        return part;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> listParts(String param) {
        String query;

        if (param == null || param.equals("all")) {
            query = "FROM Part";
        } else if (param.equals("needOnly")) {
            query = "FROM Part E WHERE E.needed = true";
        } else if (param.equals("optionOnly")) {
            query = "FROM Part E WHERE E.needed = false";
        } else {
            query = "FROM Part E WHERE E.name like '%"+ param +"%'";
        }

        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery(query).list();

        return partList;
    }
}
