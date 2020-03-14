package com.hong.py.video.manage.controller;

import com.github.pagehelper.PageInfo;
import com.hong.py.video.common.pojo.VideoResult;
import com.hong.py.video.manage.service.VideoInfoService;
import com.hong.py.video.pojo.VideoInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class VideoInfoController {

    @Autowired
    private VideoInfoService videoInfoService;

    /*@RequestMapping("/")
    public String Welcome()
    {
        return "index";
    }*/

    @RequestMapping("/")
    public String selVideos(@RequestParam(value = "pageNumber",defaultValue = "1") Integer pageNumber,
                              @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
                              Model model)
    {
        /*List<VideoInfo> videoInfoList = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            VideoInfo  videoInfo=new VideoInfo((long) i,1L,"测试"+i,"","","","","",new Date(),new Date(),"这是个测试类"+i);
            videoInfoList.add(videoInfo);
        }*/
        //List<VideoInfo> videoInfoList1 = videoInfoList.subList((pageNumber - 1) * pageSize, pageSize);
        //PageInfo<VideoInfo> pageInfo=new PageInfo<>(videoInfoList);

        PageInfo<VideoInfo> pageInfo = videoInfoService.selVideos(0, pageNumber, pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }

    @RequestMapping("video/save")
    @ResponseBody
    public VideoResult saveContent(VideoInfo videoInfo)
    {
        VideoResult result=new VideoResult();
        int index=videoInfoService.saveVideoInfo(videoInfo);
        if(index>0) {
            result.setStatus(200);
        }
        return result;
    }

}
