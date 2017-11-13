package com.baidu.cost.domain;

import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

public class Cost {
    private Integer costId;
    @NotBlank(message = "不能为空")
    private String costName;
    @NotBlank(message = "不能为空")
    private Integer baseDuration;
    @NotBlank(message = "不能为空")
    private Double baseCost;
    @NotBlank(message = "不能为空")
    private Double unitCost;

    private Integer status;
    @NotBlank(message = "不能为空")
    private String des;

    private Date createTime;

    private Date startTime;

    private Integer costType;

    public Cost() {
    }

    public Cost(Integer costId, String costName, Integer baseDuration, Double baseCost, Double unitCost, Integer status, String des, Date creatTime, Date startTime, Integer costType) {
        this.costId = costId;
        this.costName = costName;
        this.baseDuration = baseDuration;
        this.baseCost = baseCost;
        this.unitCost = unitCost;
        this.status = status;
        this.des = des;
        this.createTime = creatTime;
        this.startTime = startTime;
        this.costType = costType;
    }

    public Cost(String costName, Integer baseDuration, Double baseCost, Double unitCost, Integer status, String des, Date creatTime, Date startTime, Integer costType) {
        this.costName = costName;
        this.baseDuration = baseDuration;
        this.baseCost = baseCost;
        this.unitCost = unitCost;
        this.status = status;
        this.des = des;
        this.createTime = creatTime;
        this.startTime = startTime;
        this.costType = costType;
    }

    @Override
    public String toString() {
        return "Cost{" +
                "costId=" + costId +
                ", costName='" + costName + '\'' +
                ", baseDuration=" + baseDuration +
                ", baseCost=" + baseCost +
                ", unitCost=" + unitCost +
                ", status='" + status + '\'' +
                ", des='" + des + '\'' +
                ", createTime=" + createTime +
                ", startTime=" + startTime +
                ", costType='" + costType + '\'' +
                '}';
    }

    public Integer getCostId() {
        return costId;
    }

    public void setCostId(Integer costId) {
        this.costId = costId;
    }

    public String getCostName() {
        return costName;
    }

    public void setCostName(String costName) {
        this.costName = costName;
    }

    public Integer getBaseDuration() {
        return baseDuration;
    }

    public void setBaseDuration(Integer baseDuration) {
        this.baseDuration = baseDuration;
    }

    public Double getBaseCost() {
        return baseCost;
    }

    public void setBaseCost(Double baseCost) {
        this.baseCost = baseCost;
    }

    public Double getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(Double unitCost) {
        this.unitCost = unitCost;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Integer getCostType() {
        return costType;
    }

    public void setCostType(Integer costType) {
        this.costType = costType;
    }
}