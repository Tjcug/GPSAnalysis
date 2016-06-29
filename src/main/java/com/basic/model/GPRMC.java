package com.basic.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by dello on 2016/6/29.
 */
public class GPRMC implements Serializable {
    private Integer id;
    private String locationstatus;
    private Double latitude;
    private String latitudearth;  //纬度半球
    private Double longitude;
    private String longitudearth;   //经度半球
    private String rate;
    private String direction;
    private Date date;  //当前日期时间
    private String declination;  //磁偏角
    private String declinationdirection;  //磁偏角方向
    private String modeindication;  //模式指示

    public GPRMC() {
    }

    @Override
    public String toString() {
        return "GPRMC{" +
                ", locationstatus='" + locationstatus + '\'' +
                ", latitude='" + latitude + '\'' +
                ", latitudearth='" + latitudearth + '\'' +
                ", longitude='" + longitude + '\'' +
                ", longitudearth='" + longitudearth + '\'' +
                ", rate='" + rate + '\'' +
                ", direction='" + direction + '\'' +
                ", date=" + date +
                ", declination='" + declination + '\'' +
                ", declinationdirection='" + declinationdirection + '\'' +
                ", modeindication='" + modeindication + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLocationstatus() {
        return locationstatus;
    }

    public void setLocationstatus(String locationstatus) {
        this.locationstatus = locationstatus;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getLatitudearth() {
        return latitudearth;
    }

    public void setLatitudearth(String latitudearth) {
        this.latitudearth = latitudearth;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getLongitudearth() {
        return longitudearth;
    }

    public void setLongitudearth(String longitudearth) {
        this.longitudearth = longitudearth;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDeclination() {
        return declination;
    }

    public void setDeclination(String declination) {
        this.declination = declination;
    }

    public String getDeclinationdirection() {
        return declinationdirection;
    }

    public void setDeclinationdirection(String declinationdirection) {
        this.declinationdirection = declinationdirection;
    }

    public String getModeindication() {
        return modeindication;
    }

    public void setModeindication(String modeindication) {
        this.modeindication = modeindication;
    }
}
