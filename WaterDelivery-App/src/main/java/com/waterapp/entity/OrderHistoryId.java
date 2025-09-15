package com.waterapp.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class OrderHistoryId implements Serializable{

	private int oId;
    private int userId; // Reference to User PK

    public OrderHistoryId() {}

    public OrderHistoryId(int oId, int userId) {
        this.oId = oId;
        this.userId = userId;
    }

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(oId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderHistoryId other = (OrderHistoryId) obj;
		return oId == other.oId && userId == other.userId;
	}
    
	
}
