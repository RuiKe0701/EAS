package service.impl;

import dao.StudentMapper;

import org.springframework.stereotype.Service;
import service.StudentService;

import javax.annotation.Resource;
import java.util.List;
@Service("studentService")
public class StudnetServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    public List<Student> selectstudent() {
        return studentMapper.selectstudent();
    }
}

