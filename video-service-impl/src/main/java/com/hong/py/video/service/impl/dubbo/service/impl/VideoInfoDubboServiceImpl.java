package com.hong.py.video.service.impl.dubbo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hong.py.video.pojo.VideoInfo;
import com.hong.py.video.pojo.VideoInfoExample;
import com.hong.py.video.service.VideoInfoDubboService;
import com.hong.py.video.service.impl.mapper.VideoInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoInfoDubboServiceImpl implements VideoInfoDubboService {

    @Autowired
    private VideoInfoMapper videoInfoMapper;

    @Override
    public PageInfo<VideoInfo> selVideos(long categoryId, int page, int rows) {
        PageHelper.startPage(page,rows);
        VideoInfoExample example = new VideoInfoExample();
        if (categoryId != 0) {
            example.createCriteria().andCategoryIdEqualTo(categoryId);
        }
        List<VideoInfo> videoInfos = videoInfoMapper.selectByExample(example);
        PageInfo<VideoInfo> pageInfo = new PageInfo<>(videoInfos);
        return pageInfo;
    }

    @Override
    public int saveVideoInfo(VideoInfo content) {
        return videoInfoMapper.insert(content);
    }

    @Override
    public List<VideoInfo> show(int count, boolean isSort) {
        return null;
    }
}
