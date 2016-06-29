package com.basic.model;

import java.io.Serializable;

/**
 * Created by dello on 2016/6/29.
 */
public class GPGSVSatellite implements Serializable {
    private Integer id;
    private String prn;
    private String te; //仰角
    private String azimuth; //方位角
    private String snr; //信噪比


    public GPGSVSatellite() {
    }

    public GPGSVSatellite(String prn, String te, String azimuth, String snr) {
        this.prn = prn;
        this.te = te;
        this.azimuth = azimuth;
        this.snr = snr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrn() {
        return prn;
    }

    public void setPrn(String prn) {
        this.prn = prn;
    }

    public String getTe() {
        return te;
    }

    public void setTe(String te) {
        this.te = te;
    }

    public String getAzimuth() {
        return azimuth;
    }

    public void setAzimuth(String azimuth) {
        this.azimuth = azimuth;
    }

    public String getSnr() {
        return snr;
    }

    public void setSnr(String snr) {
        this.snr = snr;
    }

    @Override
    public String toString() {
        return "GPGSVSatellite{" +
                "prn='" + prn + '\'' +
                ", te='" + te + '\'' +
                ", azimuth='" + azimuth + '\'' +
                ", snr='" + snr + '\'' +
                '}';
    }
}
