package com.hong.py.video.manage.service.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.hong.py.video.manage.service.VideoInfoService;
import com.hong.py.video.pojo.VideoInfo;
import com.hong.py.video.service.VideoInfoDubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * videoInfoServiceImpl
 */
@Service
public class VideoServiceImpl implements VideoInfoService {

    @Reference
    private VideoInfoDubboService videoInfoDubboService;

    @Override
    public PageInfo<VideoInfo> selVideos(long categoryId, int page, int rows) {
        return videoInfoDubboService.selVideos(categoryId,page,rows);
    }

    @Override
    public int saveVideoInfo(VideoInfo content) {
        return videoInfoDubboService.saveVideoInfo(content);
    }

    @Override
    public List<VideoInfo> show(int count, boolean isSort) {
        return null;
    }
}
