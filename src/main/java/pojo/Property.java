package pojo;

public class Property {
    private Integer id;
    private String name;
    private String propertyname;

    public String getPropertyname() {
        return propertyname;
    }

    public void setPropertyname(String propertyname) {
        this.propertyname = propertyname;
    }

    public Property(Integer id, String name,String propertyname) {
        this.id = id;
        this.name = name;
        this.propertyname=propertyname;
    }
    public Property(){}
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
