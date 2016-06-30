package com.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

/**
 * Created by dello on 2016/6/30.
 */
@Controller
public class UploadController extends BaseController {
    /**
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadFile",
            produces = "application/json;charset=UTF-8")
    public ModelAndView uploadFile(@RequestParam("file") MultipartFile file) throws Exception {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("upload/index");
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File("data/"+file.getOriginalFilename())));
                stream.write(bytes);
                stream.close();
                modelAndView.addObject("message","上传成功");
            } catch (Exception e) {
                modelAndView.addObject("message",e.getMessage());
            }
        } else {
            modelAndView.addObject("message","文件不存在！");
        }
        return modelAndView;
    }

}
