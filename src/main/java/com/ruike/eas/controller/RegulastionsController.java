package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Regulations;
import com.ruike.eas.pojo.Regulationstype;
import com.ruike.eas.service.RegulationsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Controller
public class RegulastionsController {
    @Resource
    public RegulationsService regulationsService;
    //初始化进入规章页面
    @RequestMapping("/regulastions.do")
    public String regulastions(HttpServletRequest request){
        Regulations regulations=new Regulations();
        regulations.setTiao(50);
        List<Regulations> regulationsList=regulationsService.SelectRegulationByRl(regulations);
        List<Regulationstype> regulationstypeList=regulationsService.selectrltbyrlt(null);
        request.setAttribute("regulationstypeList",regulationstypeList);
        request.setAttribute("regulationsList",regulationsList);
     return "thregulations";
    }
    //
    @RequestMapping("/selectregulationsbysl.do")
    public void SelectRegulationsbysl(Integer typeid, String rasname, PrintWriter printWriter){
        if(typeid!=null){
            Regulations regulations=new Regulations();
            regulations.setRast_id(typeid);
            List<Regulations> regulationsList=regulationsService.SelectRegulationByRl(regulations);
            String jsonString = JSON.toJSONString(regulationsList);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }else if (rasname!=null){

        }
    }
    //添加规章类型
    @RequestMapping("/insertintoraltype.do")
    public void InsertIntoRaltype(String raltypename,PrintWriter printWriter){
        if(raltypename!=null){
            Regulationstype regulationstype=new Regulationstype();
            regulationstype.setRast_name(raltypename);
            Integer a=regulationsService.insertintoral(regulationstype);
            if (a>0){
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else {
                String jsonString = JSON.toJSONString(2);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();

            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();

        }
    }
    //新增规章
    @RequestMapping("/insertintoral.do")
    public void InsertIntoRal(String rasname,Integer rasfraction,Integer way,Integer typeid,PrintWriter printWriter,HttpServletRequest request){
        if(rasname!=null&&rasfraction!=null&&way!=null&&typeid!=null){
            Regulations regulations=new Regulations();
            regulations.setRas_name(rasname);
            regulations.setRas_createby((Integer) request.getSession().getAttribute("th"));
            System.out.println((Integer) request.getSession().getAttribute("th")+"sssssssssssssssssssssssssssssssssss");
            regulations.setRas_way(way);
            regulations.setRast_id(typeid);
            regulations.setRas_fraction(rasfraction);
            regulations.setRas_createday(new Date());
            Integer a=regulationsService.InsertRegulation(regulations);
            if (a>0){
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else {
                String jsonString = JSON.toJSONString(2);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();

            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();

        }
    }
}
