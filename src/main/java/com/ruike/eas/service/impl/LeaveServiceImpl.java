package com.ruike.eas.service.impl;

import com.ruike.eas.dao.LeaveMapper;
import com.ruike.eas.dao.StudentMapper;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.pojo.Stuleave;
import com.ruike.eas.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {
    @Autowired
    private LeaveMapper leaveMapper;
    @Autowired
    private StudentMapper studentMapper;


    public Integer insertleave(List<Stuleave> stuleaveList) {
        return leaveMapper.insertleave(stuleaveList);
    }

    public List<Stuleave> selectByleave(Stuleave stuleave) {
        return leaveMapper.selectByleave(stuleave);
    }

    public List<Stu> selectstubyclassid(Stu stu) {
        return studentMapper.selectStuclassid(stu);
    }

    public Integer updateleave(Stuleave stuleave) {
        return leaveMapper.updateleave(stuleave);
    }


}
