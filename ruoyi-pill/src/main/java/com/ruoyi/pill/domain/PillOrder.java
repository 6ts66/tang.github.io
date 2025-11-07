package com.ruoyi.pill.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 我的订单对象 pill_order
 *
 * @author lsl
 * @date 2025-11-01
 */
public class PillOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    @Excel(name = "订单ID")
    private Long orderId;

    /** 用户ID */
    private Long userId;

    /** 药品ID */
    @Excel(name = "药品ID")
    private Long drugId;

    /** 购买数量 */
    @Excel(name = "购买数量")
    private Long quantity;

    /** 总金额 */
    @Excel(name = "总金额")
    private BigDecimal totalPrice;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String drugName;

    /** 药品编码 */
    @Excel(name = "药品编码")
    private String drugCode;

    /** 药品单价 */
    @Excel(name = "药品单价")
    private BigDecimal unitPrice;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String status;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    // 添加getter和setter
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    // getter和setter方法
    public String getDrugName() {
        return drugName;
    }

    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }

    public String getDrugCode() {
        return drugCode;
    }

    public void setDrugCode(String drugCode) {
        this.drugCode = drugCode;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setDrugId(Long drugId)
    {
        this.drugId = drugId;
    }

    public Long getDrugId()
    {
        return drugId;
    }
    public void setQuantity(Long quantity)
    {
        this.quantity = quantity;
    }

    public Long getQuantity()
    {
        return quantity;
    }
    public void setTotalPrice(BigDecimal totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getTotalPrice()
    {
        return totalPrice;
    }

    // 更新toString方法
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("orderId", getOrderId())
                .append("status", getStatus())          // 新增
                .append("updateTime", getUpdateTime())  // 新增
                .append("userId", getUserId())
                .append("drugId", getDrugId())
                .append("quantity", getQuantity())
                .append("totalPrice", getTotalPrice())
                .append("createTime", getCreateTime())
                .toString();
    }
}
