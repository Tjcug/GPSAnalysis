package com.basic.controller;

import com.basic.gps.GPSAnalysis;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by dello on 2016/6/29.
 */
@Controller
public class BaseController {
    @Autowired
    protected GPSAnalysis gpsAnalysis;

    protected Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
}
