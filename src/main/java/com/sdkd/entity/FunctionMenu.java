package com.sdkd.entity;

/**
 * @author Young
 * @date 2020/5/1 0:44
 * @see com.sdkd.entity
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "FunctionMenu", schema = "dbo", catalog = "textile")
public class FunctionMenu implements java.io.Serializable {

    private static final long serialVersionUID = 6045707412629009693L;
    private Integer id;
    private FunctionMenu functionMenu;// 父菜单
    private String functionCode;
    private String functionName;
    private String url;
    private String remark;
    private Integer sequence;

    public FunctionMenu() {
    }

    @Id
    @GeneratedValue
    @Column(name = "FunctionID", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "Fat_FunctionID")
    public FunctionMenu getFunctionMenu() {
        return this.functionMenu;
    }

    public void setFunctionMenu(FunctionMenu functionMenu) {
        this.functionMenu = functionMenu;
    }

    @Column(name = "FunctionCode", length = 50)
    public String getFunctionCode() {
        return this.functionCode;
    }

    public void setFunctionCode(String functionCode) {
        this.functionCode = functionCode;
    }

    @Column(name = "FunctionName", length = 50)
    public String getFunctionName() {
        return this.functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    @Column(name = "URL", length = 50)
    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Column(name = "Remark", length = 1024)
    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column(name = "sequence")
    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }
}
