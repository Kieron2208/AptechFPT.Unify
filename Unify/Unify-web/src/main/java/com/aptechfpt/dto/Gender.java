package com.aptechfpt.dto;

/**
 *
 * @author Kiero
 */
public enum Gender {
    Male ("M"), 
    Female("F");

    private String value;

    private Gender(String value){
        this.value = value;
    }

    @Override
    public String toString() {
        return value;
    }

}
