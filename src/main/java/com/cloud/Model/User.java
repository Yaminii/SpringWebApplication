package com.cloud.Model;  

import com.cloud.Model.*;
import com.cloud.Controller.*;
import java.util.HashMap;

public class User {  

    private String name;  
    private String age;  
    private String qualification; 
    private String dob;
    private String gender;
    private String address;
    private String mobile;
    private String religion;
    private String nationality;
    private String email;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   @Override
   public String toString(){
       
      return getName() + " " + getAge() + " " + getAddress() + " " + getDob() + " " + getMobile() + " "  + getNationality() + " " + getQualification() + " " + getReligion() + " " + getGender();
   }
   
    
    
    

 }  