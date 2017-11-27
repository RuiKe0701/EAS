package com.ruike.eas.controller;

import com.ruike.eas.service.StutotalscoreService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class StutotalscoreController {
    @Resource
    private StutotalscoreService stutotalscoreService;

}
