package com.example.mvccpool.models;

public class Student {
    private int id;
    private String name;
    private String faculty_group;
    private String gender;
    private int age;

    public Student(int id, String name, String faculty_group, String gender, int age) {
        this.id = id;
        this.name = name;
        this.faculty_group = faculty_group;
        this.gender = gender;
        this.age = age;
    }

    public Student(String name, String faculty_group, String gender, int age) {
        this.name = name;
        this.faculty_group = faculty_group;
        this.gender = gender;
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFaculty_group() {
        return faculty_group;
    }

    public void setFaculty_group(String faculty_group) {
        this.faculty_group = faculty_group;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
