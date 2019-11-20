package com.reflectcode.demo.firebase;

public class aUser {
    public String username;
    public String email;

    public aUser() {
        // Default constructor required for calls to DataSnapshot.getValue(aUser.class)
    }

    public aUser(String username, String email) {
        this.username = username;
        this.email = email;
    }
}
