package com.ces.intern.apitimecloud.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name ="user")
public class UserEntity implements Serializable {
    private static final long serialVersionUID = 7559503200327808496L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uesrId")
    private Integer id;

    @Column(name = "userName")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "gender")
    private boolean gender;

    @Column(name = "address")
    private String address;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "idActive")
    private boolean isActive;

    @OneToMany(fetch = FetchType.LAZY,
                mappedBy = "user",
                cascade = {
                        CascadeType.DETACH,CascadeType.MERGE,
                        CascadeType.PERSIST,CascadeType.REFRESH
                })
    private List<TimeEntity> times;

    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.DETACH,CascadeType.MERGE,
                    CascadeType.PERSIST,CascadeType.REFRESH
            })
    @JoinTable(
            name = "project_user",
            joinColumns = @JoinColumn(name = "userId"),
            inverseJoinColumns = @JoinColumn(name = "projectId")
    )
    private List<ProjectEntity> projects;

    public UserEntity(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public List<TimeEntity> getTimes() {
        return times;
    }

    public void setTimes(List<TimeEntity> times) {
        this.times = times;
    }

    public List<ProjectEntity> getProjects() {
        return projects;
    }

    public void setProjects(List<ProjectEntity> projects) {
        this.projects = projects;
    }
}