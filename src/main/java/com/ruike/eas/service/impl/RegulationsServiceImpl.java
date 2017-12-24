package com.ruike.eas.service.impl;

import com.ruike.eas.dao.RegulationsMapper;
import com.ruike.eas.dao.RegulationsTypeMapper;
import com.ruike.eas.pojo.Regulations;
import com.ruike.eas.pojo.Regulationstype;
import com.ruike.eas.service.RegulationsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("regulationService")
public class RegulationsServiceImpl implements RegulationsService{
    @Autowired
    public RegulationsMapper regulationsMapper;
    @Autowired
    public RegulationsTypeMapper regulationsTypeMapper;
    public List<Regulations> SelectRegulationByRl(Regulations regulations) {
        return regulationsMapper.SelectRegulationByRl(regulations);
    }

    public List<Regulationstype> selectrltbyrlt(Regulationstype regulationstype) {
        return regulationsTypeMapper.selectrltbyrlt(regulationstype);
    }

    public Integer insertintoral(Regulationstype regulationstype) {
        return regulationsTypeMapper.insertintoral(regulationstype);
    }

    public Integer InsertRegulation(Regulations regulations) {
        return regulationsMapper.InsertRegulation(regulations);
    }
}
