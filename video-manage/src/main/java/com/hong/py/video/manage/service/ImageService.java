package com.hong.py.video.manage.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

/**
 * 文件描述
 *
 * @ProductName: HONGPY
 * @ProjectName: videobase
 * @Package: com.hong.py.video.manage.service
 * @Description: note
 * @Author: hongpy21691
 * @CreateDate: 2020/3/13 10:02
 * @UpdateUser: hongpy21691
 * @UpdateDate: 2020/3/13 10:02
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>
 * Copyright © 2020 hongpy Technologies Inc. All Rights Reserved
 * 图片服务类
 **/
public interface ImageService {
    /**
     * web文件上传
     * @param file
     * @return
     */
    Map<String,Object> upload(MultipartFile file) throws IOException;
}
