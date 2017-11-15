package service.impl;

import dao.StudentMapper;

import org.springframework.stereotype.Service;
import pojo.Stu;
import service.StudentService;

import javax.annotation.Resource;
import java.util.List;
@Service("studentService")
public class StudnetServiceImpl implements StudentService {

    public List<Stu> selectByStudent(Stu stu) {
        return null;
    }

    public Integer addStu(Stu stu) {
        return null;
    }

    public Integer updateStuInfo(Stu stu) {
        return null;
    }
}

