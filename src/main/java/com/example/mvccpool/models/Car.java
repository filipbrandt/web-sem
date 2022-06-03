package com.example.mvccpool.models;

public class Car {
    private int id;
    private String make;
    private String model;
    private int year;
    private String fuel;
    private String transmission;
    private int power;
    private int driven;
    private String description;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    private int userId;


    public Car(int id, String make, String model, int year, String fuel, String transmission, int power, int driven, String description, int userId) {
        this.id = id;
        this.make = make;
        this.model = model;
        this.year = year;
        this.fuel = fuel;
        this.transmission = transmission;
        this.power = power;
        this.driven = driven;
        this.description = description;
        this.userId = userId;
    }

    public Car(String make, String model, int year, String fuel, String transmission, int power, int driven, String description, int userId) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.fuel = fuel;
        this.transmission = transmission;
        this.power = power;
        this.driven = driven;
        this.description = description;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public int getDriven() {
        return driven;
    }

    public void setDriven(int driven) {
        this.driven = driven;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
