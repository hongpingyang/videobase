package com.hong.py.video.manage.controller;

import com.hong.py.video.manage.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件描述
 *
 * @ProductName: HONGPY
 * @ProjectName: videobase
 * @Package: com.hong.py.video.manage.controller
 * @Description: note
 * @Author: hongpy21691
 * @CreateDate: 2020/3/13 10:38
 * @UpdateUser: hongpy21691
 * @UpdateDate: 2020/3/13 10:38
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>
 * Copyright © 2020 hongpy Technologies Inc. All Rights Reserved
 **/
@Controller
public class ImageController {

    @Autowired
    private ImageService imageService;

    /**
     * 批量图片上传
     * @param uploadFiles
     * @return
     */
    @RequestMapping("image/upload")
    @ResponseBody
    public List<Map<String,Object>> upload(@RequestParam MultipartFile[] uploadFiles)
    {
        List<Map<String, Object>> mapList = new ArrayList<>();
        for (MultipartFile uploadFile:uploadFiles) {
            Map<String, Object> map = new HashMap<>();
            try {
                map = imageService.upload(uploadFile);
            } catch (IOException e) {
                e.printStackTrace();
                map.put("error", 1);
                map.put("message", "上传图片失败");
            }
            /*map.put("error", 0);
            map.put("url", "http://127.0.0.1/测试图片");*/
            mapList.add(map);
        }
        return mapList;
    }
}
