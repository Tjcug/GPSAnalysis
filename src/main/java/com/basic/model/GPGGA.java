package com.basic.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by dello on 2016/6/29.
 */
public class GPGGA implements Serializable {
    private Integer id;
    private Date date;
    private Double latitude;
    private String latitudearth;  //纬度半球
    private Double longitude;
    private String longitudearth;   //经度半球
    private String locationstatus;  //定位状态
    private String satellitenum;    //正在使用解算位置的卫星数量
    private String hdop;            //HDOP水平精度因子

    public GPGGA() {
    }

    public GPGGA(Date date, Double latitude, String latitudearth, Double longitude, String longitudearth, String locationstatus, String satellitenum, String hdop) {
        this.date = date;
        this.latitude = latitude;
        this.latitudearth = latitudearth;
        this.longitude = longitude;
        this.longitudearth = longitudearth;
        this.locationstatus = locationstatus;
        this.satellitenum = satellitenum;
        this.hdop = hdop;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public String getLocationstatus() {
        return locationstatus;
    }

    public void setLocationstatus(String locationstatus) {
        this.locationstatus = locationstatus;
    }

    public String getSatellitenum() {
        return satellitenum;
    }

    public void setSatellitenum(String satellitenum) {
        this.satellitenum = satellitenum;
    }

    public String getHdop() {
        return hdop;
    }

    public void setHdop(String hdop) {
        this.hdop = hdop;
    }

    @Override
    public String toString() {
        return "GPGGA{" +
                "id=" + id +
                ", date=" + date +
                ", latitude=" + latitude +
                ", latitudearth='" + latitudearth + '\'' +
                ", longitude=" + longitude +
                ", longitudearth='" + longitudearth + '\'' +
                ", locationstatus='" + locationstatus + '\'' +
                ", satellitenum='" + satellitenum + '\'' +
                ", hdop='" + hdop + '\'' +
                '}';
    }
}
