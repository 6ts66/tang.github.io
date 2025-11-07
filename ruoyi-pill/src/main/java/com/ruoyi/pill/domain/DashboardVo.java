package com.ruoyi.pill.domain;

public class DashboardVo {

    /** 药品总数 */
    private Integer totalDrugs;

    /** 今日订单 */
    private Integer todayOrders;

    /** 库存预警 */
    private Integer lowInventory;

    /** 合作厂家 */
    private Integer totalFactories;

    /** 可购药品数量（新增） */
    private Integer availableDrugs;

    /** 我的订单总数（新增） */
    private Integer myTotalOrders;

    public Integer getAvailableDrugs() {
        return availableDrugs;
    }

    public void setAvailableDrugs(Integer availableDrugs) {
        this.availableDrugs = availableDrugs;
    }

    public Integer getMyTotalOrders() {
        return myTotalOrders;
    }

    public void setMyTotalOrders(Integer myTotalOrders) {
        this.myTotalOrders = myTotalOrders;
    }

    // getter和setter方法
    public Integer getTotalDrugs() {
        return totalDrugs;
    }

    public void setTotalDrugs(Integer totalDrugs) {
        this.totalDrugs = totalDrugs;
    }

    public Integer getTodayOrders() {
        return todayOrders;
    }

    public void setTodayOrders(Integer todayOrders) {
        this.todayOrders = todayOrders;
    }

    public Integer getLowInventory() {
        return lowInventory;
    }

    public void setLowInventory(Integer lowInventory) {
        this.lowInventory = lowInventory;
    }

    public Integer getTotalFactories() {
        return totalFactories;
    }

    public void setTotalFactories(Integer totalFactories) {
        this.totalFactories = totalFactories;
    }
}