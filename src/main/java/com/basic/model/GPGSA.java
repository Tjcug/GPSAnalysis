package com.basic.model;

import java.io.Serializable;

/**
 * Created by dello on 2016/6/29.
 */
public class GPGSA implements Serializable{
    private Integer id;
    private String modes;   //模式
    private String gpsype; //定位类型
    private String prn; //
    private String pdop; //位置精度因子
    private String hdop; //水平精度因子
    private String vdop; //垂直精度因子

    public GPGSA() {
    }

    public GPGSA(String modes, String gpsype, String prn, String pdop, String hdop, String vdop) {
        this.modes = modes;
        this.gpsype = gpsype;
        this.prn = prn;
        this.pdop = pdop;
        this.hdop = hdop;
        this.vdop = vdop;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHdop() {
        return hdop;
    }

    public void setHdop(String hdop) {
        this.hdop = hdop;
    }

    public String getModes() {
        return modes;
    }

    public void setModes(String modes) {
        this.modes = modes;
    }

    public String getGpsype() {
        return gpsype;
    }

    public void setGpsype(String gpsype) {
        this.gpsype = gpsype;
    }

    public String getPrn() {
        return prn;
    }

    public void setPrn(String prn) {
        this.prn = prn;
    }

    public String getPdop() {
        return pdop;
    }

    public void setPdop(String pdop) {
        this.pdop = pdop;
    }

    public String getVdop() {
        return vdop;
    }

    public void setVdop(String vdop) {
        this.vdop = vdop;
    }

    @Override
    public String toString() {
        return "GPGSA{" +
                "modes='" + modes + '\'' +
                ", gpsype='" + gpsype + '\'' +
                ", prn='" + prn + '\'' +
                ", pdop='" + pdop + '\'' +
                ", hdop='" + hdop + '\'' +
                ", vdop='" + vdop + '\'' +
                '}';
    }
}
