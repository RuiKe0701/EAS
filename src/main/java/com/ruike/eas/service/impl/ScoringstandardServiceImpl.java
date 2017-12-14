package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ScoringstandardMapper;
import com.ruike.eas.pojo.Scoringstandard;
import com.ruike.eas.service.ScoringstandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("scoringstandardService")
public class ScoringstandardServiceImpl implements ScoringstandardService{
    @Autowired
    private ScoringstandardMapper scoringstandardMapper;

    public int insert(Scoringstandard param) {
        return scoringstandardMapper.insert(param);
    }

    public List<Scoringstandard> selectAll(Scoringstandard param) {
        return scoringstandardMapper.selectAll(param);
    }

    public Integer updatessd(Scoringstandard scoringstandard) {
        return scoringstandardMapper.updatessd(scoringstandard);
    }

    public Scoringstandard selectssdbyssdid(Scoringstandard scoringstandard) {
        return scoringstandardMapper.selectssdbyssdid(scoringstandard);
    }
}
