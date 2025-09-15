package com.waterapp.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class CartId implements Serializable {

	private int userId;
    private int serialId;

    public CartId() {}

    public CartId(int userId, int serialId) {
        this.userId = userId;
        this.serialId = serialId;
    }

    // getters & setters
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getSerialId() {
        return serialId;
    }
    public void setSerialId(int serialId) {
        this.serialId = serialId;
    }

    // equals & hashCode (VERY IMPORTANT for composite keys)
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CartId)) return false;
        CartId that = (CartId) o;
        return userId == that.userId && serialId == that.serialId;
    }

    @Override
    public int hashCode() {
        return 31 * userId + serialId;
    }
}
