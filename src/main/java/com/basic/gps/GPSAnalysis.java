package com.basic.gps;

import com.basic.model.*;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by dello on 2016/6/29.
 */
@Component
public class GPSAnalysis {
    public static List<GPGSA> gpgsaList=new ArrayList<>();//当前卫星信息
    public static List<GPGSV> gpgsvList=new ArrayList<>();//可见卫星信息
    public static List<GPRMC> gprmcList=new ArrayList<>();//推荐定位信息
    public static List<GPGGA> gpggaList=new ArrayList<>();//GPS定位信息

    private static String dataPath="data/data.txt";
    private static Scanner scan;

    static {
        try {
            InputStream in = new FileInputStream(new File(dataPath));
            scan=new Scanner(in);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void resetanalogy() throws FileNotFoundException {
        InputStream in = new FileInputStream(new File(dataPath));
        scan=new Scanner(in);
    }
    public Map scanLine() throws Exception {
        Map map=new HashMap();
        if(!scan.hasNextLine()){
            return map;
        }
        String data=scan.nextLine();
        switch (data.substring(1,data.indexOf(','))){
            case "GPGSA":
                GPGSA gpgsa = analysisGPGSA(data);
                map.put("gpgsa",gpgsa);
                break;
            case "GPGSV":
                GPGSV gpgsv = analysisGPGSV(data);
                map.put("gpgsv",gpgsv);
                break;
            case "GPRMC":
                GPRMC gprmc = analysisGPRMC(data);
                map.put("gprmc",gprmc);
                break;
            case "GPGGA":
                GPGGA gpgga = analysisGPGGA(data);
                map.put("gpgga",gpgga);
                break;
        }
        return map;
    }
    public void fullScan() throws Exception {
        gpgsaList=new ArrayList<>();//当前卫星信息
        gpgsvList=new ArrayList<>();//可见卫星信息
        gprmcList=new ArrayList<>();//推荐定位信息
        gpggaList=new ArrayList<>();//GPS定位信息
        InputStream in = new FileInputStream(new File(dataPath));
        Scanner s = new Scanner(in);
        while(s.hasNextLine()){
            String data=s.nextLine();
            switch (data.substring(1,data.indexOf(','))){
                case "GPGSA":
                    GPGSA gpgsa = analysisGPGSA(data);
                    if(gpgsa!=null)
                        gpgsaList.add(gpgsa);
                    break;
                case "GPGSV":
                    GPGSV gpgsv = analysisGPGSV(data);
                    if(gpgsv!=null)
                        gpgsvList.add(gpgsv);
                    break;
                case "GPRMC":
                    GPRMC gprmc = analysisGPRMC(data);
                    if(gprmc!=null)
                        gprmcList.add(gprmc);
                    break;
                case "GPGGA":
                    GPGGA gpgga = analysisGPGGA(data);
                    if(gpgga!=null)
                        gpggaList.add(gpgga);
                    break;
            }

        }
    }

    private GPGGA analysisGPGGA(String data) throws Exception {
        GPGGA gpgga=new GPGGA();
        String[] dataList=data.split(",");
        if(dataList[2].equals("")||dataList[4].equals("")){
            return null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss");
        String hour=dataList[1].substring(0,2);
        String minutes=dataList[1].substring(2,4);
        String seconds=dataList[1].substring(4);
        String datetime=hour+":"+minutes+":"+seconds;
        gpgga.setDate(sdf.parse(datetime));
        gpgga.setLatitude(functionlatitude(dataList[2]));
        gpgga.setLatitudearth(dataList[3]);
        gpgga.setLongitude(functionlongitude(dataList[4]));
        gpgga.setLongitudearth(dataList[5]);

        String temp="";
        switch (Integer.valueOf(dataList[6])){
            case 0:
                temp="未定位";
                break;
            case 1:
                temp="非差分定位";
                break;
            case 2:
                temp="差分定位";
                break;
            case 6:
                temp="正在估算";
                break;
        }
        gpgga.setLocationstatus(temp);

        gpgga.setSatellitenum(dataList[7]);
        gpgga.setHdop(dataList[8]);
        gpgga.setId(gpggaList.size()+1);
        return gpgga;
    }

    private GPRMC analysisGPRMC(String data) throws Exception {
        GPRMC gprmc=new GPRMC();
        String[] dataList=data.split(",");
        if(dataList[3].equals("")||dataList[5].equals("")){
            return null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        String year="20"+dataList[9].substring(4);
        String month=dataList[9].substring(2,4);
        String day=dataList[9].substring(0,2);
        String hour=dataList[1].substring(0,2);
        String minutes=dataList[1].substring(2,4);
        String seconds=dataList[1].substring(4);
        String datetime=year+"-"+month+"-"+day+" "+hour+":"+minutes+":"+seconds;
        gprmc.setDate(sdf.parse(datetime));

        String locationstatus="";
        switch (dataList[2]){
            case "A":
                locationstatus="有效定位";
                break;
            case "V":
                locationstatus="无效定位";
                break;
        }

        gprmc.setLocationstatus(locationstatus);
        System.out.println(data);
        gprmc.setLatitude(functionlatitude(dataList[3]));
        gprmc.setLatitudearth(dataList[4]);
        gprmc.setLongitude(functionlongitude(dataList[5]));
        gprmc.setLongitudearth(dataList[6]);
        gprmc.setRate(dataList[7]);
        gprmc.setDirection(dataList[8]);
        gprmc.setDeclination(dataList[10]);
        gprmc.setDeclinationdirection(dataList[11]);
        String modeindication="";
        switch (dataList[12].substring(0,dataList[12].indexOf("*"))){
            case "A":
                modeindication="自主定位";
                break;
            case "D":
                modeindication="差分";
                break;
            case "E":
                modeindication="估算";
                break;
            case "N":
                modeindication="数据无效";
                break;
        }
        gprmc.setModeindication(modeindication);
        gprmc.setId(gprmcList.size()+1);
        return gprmc;
    }

    private GPGSV analysisGPGSV(String data) {
        GPGSV gpgsv=new GPGSV();
        String[] dataList=data.split(",");
        gpgsv.setGsvtotal(dataList[1]);
        gpgsv.setGsvnum(dataList[2]);
        gpgsv.setSatellitetotal(dataList[3]);
        Integer satellitetotal=Integer.valueOf(dataList[3]);
        Integer Gsvtotal=Integer.valueOf(dataList[1]);
        Integer Gsvnum=Integer.valueOf(dataList[2]);

        int num=0;
        if(Gsvnum<Gsvtotal)
            num=4;
        if(Gsvnum==Gsvtotal)
            num=satellitetotal%4;
        List<GPGSVSatellite> satelliteList=new ArrayList<>();
        for(int i=0;i<num;i++){
            GPGSVSatellite gpgsvSatellite=new GPGSVSatellite();
            gpgsvSatellite.setPrn(dataList[(i+1)*4]);
            gpgsvSatellite.setTe(dataList[(i+1)*4+1]);
            gpgsvSatellite.setAzimuth(dataList[(i+1)*4]+2);
            gpgsvSatellite.setSnr(dataList[(i+1)*4]+3);
            gpgsvSatellite.setId(satelliteList.size()+1);
            satelliteList.add(gpgsvSatellite);
        }
        gpgsv.setGpgsvSatelliteList(satelliteList);
        gpgsv.setId(gpgsvList.size()+1);
        return gpgsv;
    }

    private GPGSA analysisGPGSA(String data) {
        GPGSA gpgsa=new GPGSA();
        String[] dataList=data.split(",");
        String modes="";
        switch (dataList[1]){
            case "A":
                modes="自动";
                break;
            case "M":
                modes="手动";
                break;
        }
        gpgsa.setModes(modes);

        String gpstype="";
        switch (dataList[2]){
            case "1":
                gpstype="没有定位";
                break;
            case "2":
                gpstype="2D定位";
                break;
            case "3":
                gpstype="3D定位";
                break;
        }
        gpgsa.setGpsype(dataList[2]);
        StringBuilder sb=new StringBuilder();
        for(int i=3;i<=14;i++){
            if(!dataList[i].equals(""))
            sb.append(dataList[i]).append(" ");
        }
        gpgsa.setPrn(sb.toString());
        gpgsa.setPdop(dataList[15]);
        gpgsa.setHdop(dataList[16]);
        gpgsa.setVdop(dataList[17].substring(0,dataList[17].indexOf("*")));
        gpgsa.setId(gpgsaList.size()+1);
        return gpgsa;
    }

    private Double functionlongitude(String str){
        String str1=str.substring(0,3);
        String str2=str.substring(3);
        return Double.valueOf(str1)+Double.valueOf(str2)/60;
    }

    private Double functionlatitude(String str){
        String str1=str.substring(0,2);
        String str2=str.substring(2);
        return Double.valueOf(str1)+Double.valueOf(str2)/60;
    }
}
