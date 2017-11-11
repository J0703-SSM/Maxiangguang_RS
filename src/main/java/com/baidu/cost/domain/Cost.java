package com.baidu.cost.domain;

import java.util.Date;

public class Cost {
    private Integer costId;

    private String costName;

    private Integer baseDuration;

    private Double baseCost;

    private Double unitCost;

    private String status;

    private String des;

    private Date creatTime;

    private Date startTime;

    private String costType;

    public Cost() {
    }

    public Cost(Integer costId, String costName, Integer baseDuration, Double baseCost, Double unitCost, String status, String des, Date creatTime, Date startTime, String costType) {
        this.costId = costId;
        this.costName = costName;
        this.baseDuration = baseDuration;
        this.baseCost = baseCost;
        this.unitCost = unitCost;
        this.status = status;
        this.des = des;
        this.creatTime = creatTime;
        this.startTime = startTime;
        this.costType = costType;
    }

    public Cost(String costName, Integer baseDuration, Double baseCost, Double unitCost, String status, String des, Date creatTime, Date startTime, String costType) {
        this.costName = costName;
        this.baseDuration = baseDuration;
        this.baseCost = baseCost;
        this.unitCost = unitCost;
        this.status = status;
        this.des = des;
        this.creatTime = creatTime;
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
                ", creatTime=" + creatTime +
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getCostType() {
        return costType;
    }

    public void setCostType(String costType) {
        this.costType = costType;
    }
}