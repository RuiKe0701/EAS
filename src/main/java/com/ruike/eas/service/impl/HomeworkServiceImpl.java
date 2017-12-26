package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClasshomeworkMapper;
import com.ruike.eas.dao.RegulationsMapper;
import com.ruike.eas.dao.StuhomeworkMapper;
import com.ruike.eas.dao.StutotalscoreMapper;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.HomeworkService;
import org.apache.poi.hwpf.sprm.SprmUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("homeworkService")
public class HomeworkServiceImpl implements HomeworkService {
    @Autowired
    private ClasshomeworkMapper classhomeworkMapper;
    @Autowired
    public RegulationsMapper regulationsMapper;
    @Autowired
    public StutotalscoreMapper stutotalscoreMapper;
    @Autowired
    public StuhomeworkMapper stuhomeworkMapper;

    public Classhomework selectnewClasswork(Classhomework classhomework) {
        Classhomework classhomework1=classhomeworkMapper.selectnewClasswork(classhomework);
        if(classhomework1==null){
            classhomework1=new Classhomework();
            classhomework1.setChw_number(0);
        }
        return classhomework1;
    }

    public Integer addHomeworks(Classhomework classhomework, List<Stuhomework> stuhomeworkList, Date date) {
        Integer count=0;
        Integer classid=classhomework.getChw_classid();
        Integer zhengchang=0;
        Regulations regulations=new Regulations();
        regulations.setRast_id(1);
        List<Regulations> regulationsList=regulationsMapper.SelectRegulationByRl(regulations);
        Map<Integer, Regulations> map=new HashMap<Integer, Regulations>();
        for (Regulations regulations1 : regulationsList) {
            map.put(regulations1.getRas_id(),regulations1);
        }
        List<Stutotalscore> stutotalscoreList=new ArrayList<Stutotalscore>();
        for (Stuhomework stuhomework : stuhomeworkList) {
            Stutotalscore stutotalscore=new Stutotalscore();
            stutotalscore.setSts_id(stuhomework.getStsid());
            System.out.println(stuhomework.getStsid());
            Integer fenshu=0;
            Integer pingfen=map.get(stuhomework.getRas_id()).getRas_fraction();
            if (map.get(stuhomework.getRas_id()).getRas_way()==1){
                fenshu=stuhomework.getZongfen()+pingfen;
            }else {
                fenshu=stuhomework.getZongfen()+pingfen;
            }
            stutotalscore.setStu_totalscore(fenshu);
            stutotalscoreList.add(stutotalscore);
            System.out.println(stuhomework.getStu_id()+"缘分"+stuhomework.getZongfen()+"方式"+map.get(stuhomework.getRas_id()).getRas_way()+"处理后的分数"+fenshu+"处理时的分数"+pingfen);
            count+=1;
            stuhomework.setWork_date(date);
            if(stuhomework.getRas_id()==1){
             zhengchang+=1;
            }
        }
        double c= ((double) zhengchang/count)*100;
        Integer d=(int) c;
        classhomework.setChw_rate(d.toString());
        Integer as=stutotalscoreMapper.updatestusts(stutotalscoreList);
        Integer aa=classhomeworkMapper.insertclasshomework(classhomework);
        System.out.println(classhomework.getChw_id());
        for (Stuhomework stuhomework : stuhomeworkList) {
            stuhomework.setChw_id(classhomework.getChw_id());
        }
        Integer cc=stuhomeworkMapper.addstuhomeworks(stuhomeworkList);
        if(as>0&&cc>0&&aa>0){
            return Integer.parseInt(classhomework.getChw_rate());
        }else {
            return -1;
        }


    }
}
