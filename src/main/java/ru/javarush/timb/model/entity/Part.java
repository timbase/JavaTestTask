package ru.javarush.timb.model.entity;


import javax.persistence.*;

@Entity
@Table(name = "part")
public class Part {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "IS_NEEDED")
    private boolean needed;

    @Column(name = "AMOUNT")
    private int amount;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public boolean isNeeded() {
        return needed;
    }

    public int getAmount() {
        return amount;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNeeded(boolean needed) {
        this.needed = needed;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Part{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", needed=" + needed +
                ", amount=" + amount +
                '}';
    }
}
