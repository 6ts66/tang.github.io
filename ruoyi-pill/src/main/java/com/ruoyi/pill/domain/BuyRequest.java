package com.ruoyi.pill.domain;

import java.math.BigDecimal;

public class BuyRequest {
    private Long drugId;
    private String drugName;
    private Long quantity;
    private BigDecimal price;

    public Long getDrugId() {
        return drugId;
    }

    public void setDrugId(Long drugId) {
        this.drugId = drugId;
    }

    public String getDrugName() {
        return drugName;
    }

    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "BuyRequest{" +
                "drugId=" + drugId +
                ", drugName='" + drugName + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }
}