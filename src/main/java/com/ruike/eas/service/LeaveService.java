package com.ruike.eas.service;

import com.ruike.eas.pojo.Stu;
import com.ruike.eas.pojo.Stuleave;

import java.util.List;

public interface LeaveService {
    public Integer insertleave(List<Stuleave> stuleaveList);

    public List<Stuleave> selectByleave(Stuleave stuleave);
    public List<Stu> selectstubyclassid(Stu stu);
}
