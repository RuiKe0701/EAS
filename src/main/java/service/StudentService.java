package service;

import pojo.Stu;

import java.util.List;

public interface StudentService {
    public List<Stu> selectByStudent(Stu stu);

    public Integer addStu(Stu stu);

    public Integer updateStuInfo(Stu stu);
}
