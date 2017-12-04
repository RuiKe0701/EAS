package com.ruike.eas.dao;

import com.ruike.eas.pojo.Stuleave;

import java.util.List;

public interface LeaveMapper {
    public List<Stuleave> selectByleave(Stuleave stuleave);
    public Integer insertleave(List<Stuleave> stuleaveList);
}
