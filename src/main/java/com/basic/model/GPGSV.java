package com.basic.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by dello on 2016/6/29.
 */
//可见卫星信息
public class GPGSV implements Serializable {
    private Integer id;
    private String gsvtotal; //GSV总数
    private String gsvnum;  //GSV编号
    private String satellitetotal; //可见卫星总数
    private List<GPGSVSatellite> gpgsvSatelliteList;//GSV卫星信息

    public GPGSV() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGsvtotal() {
        return gsvtotal;
    }

    public void setGsvtotal(String gsvtotal) {
        this.gsvtotal = gsvtotal;
    }

    public String getGsvnum() {
        return gsvnum;
    }

    public void setGsvnum(String gsvnum) {
        this.gsvnum = gsvnum;
    }

    public String getSatellitetotal() {
        return satellitetotal;
    }

    public void setSatellitetotal(String satellitetotal) {
        this.satellitetotal = satellitetotal;
    }

    public List<GPGSVSatellite> getGpgsvSatelliteList() {
        return gpgsvSatelliteList;
    }

    public void setGpgsvSatelliteList(List<GPGSVSatellite> gpgsvSatelliteList) {
        this.gpgsvSatelliteList = gpgsvSatelliteList;
    }

    @Override
    public String toString() {
        return "GPGSV{" +
                "gsvtotal='" + gsvtotal + '\'' +
                ", gsvnum='" + gsvnum + '\'' +
                ", satellitetotal='" + satellitetotal + '\'' +
                ", gpgsvSatelliteList=" + gpgsvSatelliteList +
                '}';
    }
}
