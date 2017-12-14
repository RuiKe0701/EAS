package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.pojo.Scoringstandard;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.service.ScoringstandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/*
评分项管理
 */
@Controller
public class ScoringstandardController {
    @Resource
    private ScoringstandardService scoringstandardService;

    @RequestMapping("/scoringstandardinfo")
    public String sc(HttpServletRequest request) {
        List<Scoringstandard> scoringstandards = scoringstandardService.selectAll(null);
        for (Scoringstandard scoringstandard : scoringstandards) {
            System.out.println(scoringstandard.getTeachername());
        }
        request.setAttribute("scoringstandards", scoringstandards);
        return "thscoringstandard";
    }



    @RequestMapping("/addscoringstandard")
    public String addssd() {
        return "addscoringstandard";
    }

    /*
    根据名称查询评分项信息
     */
    @RequestMapping("/selectbyssd")
    public void selectbyssd(PrintWriter printWriter, String ssdname) {
        if (ssdname != null && ssdname != "") {
            Scoringstandard scoringstandard = new Scoringstandard();
            scoringstandard.setSs_name(ssdname);
            List<Scoringstandard> scoringstandards = scoringstandardService.selectAll(scoringstandard);
            String jsonString = JSON.toJSONString(scoringstandards);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        } else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();

        }
    }

    /*
    进行新增操作
     */
    @RequestMapping("/doaddssd")
    @ResponseBody
    public void  doaddssd(PrintWriter printWriter, Scoringstandard scoringstandard) {
        if (scoringstandard.getSs_name() != null && scoringstandard.getSs_name() != "" &&
                scoringstandard.getSs_type() != null && scoringstandard.getSs_way() != null
                && scoringstandard.getSs_fraction() != null) {
            scoringstandard.setSs_createby(1);
            scoringstandard.setSs_createdate(new Date());
            Integer aa = scoringstandardService.insert(scoringstandard);
            if (aa > 0) {
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            } else {
                String jsonString = JSON.toJSONString(0);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        } else {
            String jsonString = JSON.toJSONString(2);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
    /*
    获取单个评分信息
     */
    @RequestMapping("/selectss")
    public void Selectss(Integer ssid,PrintWriter printWriter){
        Scoringstandard scoringstandards=new Scoringstandard();
        scoringstandards.setSs_id(ssid);
        Scoringstandard scoringstandard=scoringstandardService.selectssdbyssdid(scoringstandards);
        if (scoringstandard!=null &&scoringstandard.getSs_id()!=null){
            String jsonString = JSON.toJSONString(scoringstandard);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }else{
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
    /*
    修改评分数据
     */
    @RequestMapping("/updatess")
    public void Updatess(Scoringstandard scoringstandard,PrintWriter printWriter){
        System.out.println(scoringstandard.getSs_id());
        if(scoringstandard!=null ){
            scoringstandard.setSs_createby(1);
            scoringstandard.setSs_createdate(new Date());
            Integer aa=scoringstandardService.updatessd(scoringstandard);
            if(aa>0){
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else {
                String jsonString = JSON.toJSONString(0);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }

        }else {
            String jsonString = JSON.toJSONString(2);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }



}
