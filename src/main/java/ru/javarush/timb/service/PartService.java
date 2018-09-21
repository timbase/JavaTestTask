package ru.javarush.timb.service;

import ru.javarush.timb.model.entity.Part;

import java.util.List;

public interface PartService {
    void addPart(Part part);

    void updatePart(Part part);

    void removePart(int id);

    Part getPartById(int id);

    List<Part> listParts(String param);
}
