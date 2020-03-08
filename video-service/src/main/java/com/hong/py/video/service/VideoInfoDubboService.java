package com.hong.py.video.service;

import com.github.pagehelper.PageInfo;
import com.hong.py.video.pojo.VideoInfo;

import java.util.List;

/**
 * 视频信息类服务
 */
public interface VideoInfoDubboService {

    /**
     * 分页获取视频信息
     * @param categoryId
     * @param page
     * @param rows
     * @return
     */
    PageInfo<VideoInfo> selVideos(long categoryId, int page, int rows);

    /**
     * 保存视频信息
     * @param content
     * @return
     */
    int saveVideoInfo(VideoInfo content);

    /**
     * 查询视频信息
     * @param count
     * @param isSort
     * @return
     */
    List<VideoInfo> show(int count, boolean isSort);

}
