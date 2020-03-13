package com.hong.py.video.common.utils;

import java.util.Random;

/**
 * 文件描述
 *
 * @ProductName: HONGPY
 * @ProjectName: videobase
 * @Package: com.hong.py.video.common.utils
 * @Description: note
 * @Author: hongpy21691
 * @CreateDate: 2020/3/13 10:25
 * @UpdateUser: hongpy21691
 * @UpdateDate: 2020/3/13 10:25
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>
 * Copyright © 2020 hongpy Technologies Inc. All Rights Reserved
 **/
public class IDUtils {
    /**
     * 图片名生成
     */
    public static String genImageName() {
        //取当前时间的长整形值包含毫秒
        long millis = System.currentTimeMillis();
        //long millis = System.nanoTime();
        //加上三位随机数
        Random random = new Random();
        int end3 = random.nextInt(999);
        //如果不足三位前面补0
        String str = millis + String.format("%03d", end3);
        return str;
    }
}
