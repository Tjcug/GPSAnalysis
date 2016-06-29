package com.basic.controller;

import com.basic.gps.GPSAnalysis;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dello on 2016/6/29.
 */
@Controller
public class WebController extends BaseController {
    private Logger logger= LoggerFactory.getLogger(WebController.class);
    @RequestMapping("/")
    public String index() throws Exception {
        logger.info("============================index======================");
        return "index";
    }

    @RequestMapping("/send_{var1}_{var2}")
    public String sendFunc(@PathVariable("var1") String var1, @PathVariable("var2") String var2){
        return var1+"/"+var2;
    }

    @RequestMapping(value = "/getGPGSAList",
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getGPGSAList(@RequestParam Integer page,
                               @RequestParam Integer rows) throws Exception {
        if(GPSAnalysis.gpgsaList.size()==0){
            gpsAnalysis.fullScan();
        }
        List list= GPSAnalysis.gpgsaList.subList((page-1)*rows,page*rows);
        Map pageMap=new HashMap<>();
        pageMap.put("total", GPSAnalysis.gpgsaList.size());
        pageMap.put("rows", list);
        return gson.toJson(pageMap);
    }

    @RequestMapping(value = "/getGPGSVList",
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getGPGSVList(@RequestParam Integer page,
                               @RequestParam Integer rows) throws Exception {
        if(GPSAnalysis.gpgsvList.size()==0){
            gpsAnalysis.fullScan();
        }
        Map pageMap=new HashMap<>();
        List list= GPSAnalysis.gpgsvList.subList((page-1)*rows,page*rows);
        pageMap.put("total", GPSAnalysis.gpgsvList.size());
        pageMap.put("rows",list);
        return gson.toJson(pageMap);
    }

    @RequestMapping(value = "/getGPRMCList",
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getGPRMCList(@RequestParam Integer page,
                               @RequestParam Integer rows) throws Exception {
        if(GPSAnalysis.gprmcList.size()==0){
            gpsAnalysis.fullScan();
        }
        Map pageMap=new HashMap<>();
        List list= GPSAnalysis.gprmcList.subList((page-1)*rows,page*rows);
        pageMap.put("total", GPSAnalysis.gprmcList.size());
        pageMap.put("rows", list);
        return gson.toJson(pageMap);
    }

    @RequestMapping(value = "/getGPGGAList",
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getGPGGAList(@RequestParam Integer page,
                               @RequestParam Integer rows) throws Exception {
        Gson gson=new GsonBuilder().setDateFormat("HH:mm:ss").create();
        if(GPSAnalysis.gpggaList.size()==0){
            gpsAnalysis.fullScan();
        }
        Map pageMap=new HashMap<>();
        List list= GPSAnalysis.gpggaList.subList((page-1)*rows,page*rows);
        pageMap.put("total", GPSAnalysis.gpggaList.size());
        pageMap.put("rows", list);
        return gson.toJson(pageMap);
    }

    @RequestMapping(value = "/scanLine",
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String scanLine() throws Exception {
        return gson.toJson(gpsAnalysis.scanLine());
    }

    @RequestMapping(value = "/GPRMCList",
            produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String GPRMCList() throws Exception {
        if(GPSAnalysis.gprmcList.size()==0){
            gpsAnalysis.fullScan();
        }
        return gson.toJson(GPSAnalysis.gprmcList);
    }
}
