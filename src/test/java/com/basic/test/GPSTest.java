package com.basic.test;

import com.basic.gps.GPSAnalysis;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by dello on 2016/6/29.
 */
public class GPSTest {
    private Logger logger= LoggerFactory.getLogger(GPSTest.class);
    GPSAnalysis gpsAnalysis=new GPSAnalysis();
    @Test
    public void Test() throws Exception {
        gpsAnalysis.fullScan();
        System.out.println(gpsAnalysis.gpgsaList);
        System.out.println(gpsAnalysis.gpgsvList.get(gpsAnalysis.gpgsvList.size()-1));
        System.out.println(gpsAnalysis.gprmcList);
        System.out.println(gpsAnalysis.gpggaList);
        System.out.println(gpsAnalysis.gpgsaList);
    }
}
