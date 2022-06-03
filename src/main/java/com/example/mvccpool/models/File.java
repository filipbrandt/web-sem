package com.example.mvccpool.models;

public class File {

    private int id;
    private String image;
    private int carId;

    public File(int id, String image, int carId) {
        this.id = id;
        this.image = image;
        this.carId = carId;
    }

    public File(String image, int carId) {
        this.image = image;
        this.carId = carId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }
}
