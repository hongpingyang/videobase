package com.hong.py.video.manage.service.impl;

import com.hong.py.video.common.utils.FtpUtil;
import com.hong.py.video.common.utils.IDUtils;
import com.hong.py.video.manage.service.ImageService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件描述
 *
 * @ProductName: HONGPY
 * @ProjectName: videobase
 * @Package: com.hong.py.video.manage.service.impl
 * @Description: note
 * @Author: hongpy21691
 * @CreateDate: 2020/3/13 10:21
 * @UpdateUser: hongpy21691
 * @UpdateDate: 2020/3/13 10:21
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>
 * Copyright © 2020 hongpy Technologies Inc. All Rights Reserved
 *
 **/
@Service
public class ImageServiceImpl implements ImageService {

    @Value("${ftpclient.host}")
    private String host;
    @Value("${ftpclient.port}")
    private int port;

    @Value("${ftpclient.username}")
    private String username;

    @Value("${ftpclient.password}")
    private String password;

    @Value("${ftpclient.basepath}")
    private String basepath;

    @Value("${ftpclient.filepath}")
    private String filepath;

    @Override
    public Map<String, Object> upload(MultipartFile file) throws IOException {

        String filename= IDUtils.genImageName()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

        boolean result = FtpUtil.uploadFile(host, port, username, password, basepath, filepath, filename, file.getInputStream());
        Map<String,Object> map=new HashMap<>();
        if(result)
        {
            map.put("error",0);
            map.put("url","http://"+host+"/"+filename);
        }
        else
        {
            map.put("error",1);
            map.put("message","上传图片失败");
        }

        return map;
    }
}
