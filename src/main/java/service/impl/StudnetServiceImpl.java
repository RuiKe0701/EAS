package service.impl;

import dao.StudentMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Stu;
import service.StudentService;

import javax.annotation.Resource;
import java.util.List;
@Service("studentService")
public class StudnetServiceImpl implements StudentService {
    @Autowired
    private  StudentMapper studentMapper;

    public List<Stu> defaultstudent() {
        return studentMapper.defaultstudent();
    }

    //根据id进行单个学生的基本信息展示
    public Stu selectstudentbystu(Stu stu) {
        if(stu.getStu_id()!=null){
            return  studentMapper.selectstudentbystu(stu);
        }else {
            return null;
        }
        }

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

