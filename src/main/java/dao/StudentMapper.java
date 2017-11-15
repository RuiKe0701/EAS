package dao;

import pojo.Stu;

import java.util.List;

public interface StudentMapper {
    public List<Stu> selectstudent(Stu stu);

    public Integer insertStu(Stu stu);

    public Integer updateStu(Stu stu);
}
