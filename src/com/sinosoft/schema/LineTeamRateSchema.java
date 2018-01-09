package com.sinosoft.schema;

import com.sinosoft.framework.data.DataColumn;
import com.sinosoft.framework.orm.Schema;
import com.sinosoft.framework.orm.SchemaSet;
import com.sinosoft.framework.orm.SchemaColumn;
import com.sinosoft.framework.data.QueryBuilder;

import java.util.Date;

import java.util.Date;

import java.util.Date;

import java.util.Date;

/**
 * 表名称：分支机构费率表<br>
 * 表代码：LineTeamRate<br>
 * 表主键：id<br>
 */
public class LineTeamRateSchema extends Schema {
	private String id;

	private String branchInnercode;

	private String companyCode;

	private String riskType;

	private String rate;

	private String remark1;

	private String remark2;

	private String remark3;

	private String userBranchInnercode;

	private Date createDate;

	private String createUser;

	private Date modifyDate;

	private String modifyUser;

	public static final SchemaColumn[] _Columns = new SchemaColumn[] {
		new SchemaColumn("id", DataColumn.STRING, 0, 32 , 0 , true , true),
		new SchemaColumn("branchInnercode", DataColumn.STRING, 1, 100 , 0 , true , false),
		new SchemaColumn("companyCode", DataColumn.STRING, 2, 20 , 0 , true , false),
		new SchemaColumn("riskType", DataColumn.STRING, 3, 100 , 0 , true , false),
		new SchemaColumn("rate", DataColumn.STRING, 4, 10 , 0 , true , false),
		new SchemaColumn("remark1", DataColumn.STRING, 5, 255 , 0 , false , false),
		new SchemaColumn("remark2", DataColumn.STRING, 6, 255 , 0 , false , false),
		new SchemaColumn("remark3", DataColumn.STRING, 7, 255 , 0 , false , false),
		new SchemaColumn("userBranchInnercode", DataColumn.STRING, 8, 100 , 0 , false , false),
		new SchemaColumn("createDate", DataColumn.DATETIME, 9, 0 , 0 , false , false),
		new SchemaColumn("createUser", DataColumn.STRING, 10, 100 , 0 , false , false),
		new SchemaColumn("modifyDate", DataColumn.DATETIME, 11, 0 , 0 , false , false),
		new SchemaColumn("modifyUser", DataColumn.STRING, 12, 100 , 0 , false , false)
	};

	public static final String _TableCode = "LineTeamRate";

	public static final String _NameSpace = "com.sinosoft.schema";

	protected static final String _InsertAllSQL = "insert into LineTeamRate values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

	protected static final String _UpdateAllSQL = "update LineTeamRate set id=?,branchInnercode=?,companyCode=?,riskType=?,rate=?,remark1=?,remark2=?,remark3=?,userBranchInnercode=?,createDate=?,createUser=?,modifyDate=?,modifyUser=? where id=?";

	protected static final String _DeleteSQL = "delete from LineTeamRate  where id=?";

	protected static final String _FillAllSQL = "select * from LineTeamRate  where id=?";

	public LineTeamRateSchema(){
		TableCode = _TableCode;
		NameSpace = _NameSpace;
		Columns = _Columns;
		InsertAllSQL = _InsertAllSQL;
		UpdateAllSQL = _UpdateAllSQL;
		DeleteSQL = _DeleteSQL;
		FillAllSQL = _FillAllSQL;
		HasSetFlag = new boolean[13];
	}

	protected Schema newInstance(){
		return new LineTeamRateSchema();
	}

	protected SchemaSet newSet(){
		return new LineTeamRateSet();
	}

	public LineTeamRateSet query() {
		return query(null, -1, -1);
	}

	public LineTeamRateSet query(QueryBuilder qb) {
		return query(qb, -1, -1);
	}

	public LineTeamRateSet query(int pageSize, int pageIndex) {
		return query(null, pageSize, pageIndex);
	}

	public LineTeamRateSet query(QueryBuilder qb , int pageSize, int pageIndex){
		return (LineTeamRateSet)querySet(qb , pageSize , pageIndex);
	}

	public void setV(int i, Object v) {
		if (i == 0){id = (String)v;return;}
		if (i == 1){branchInnercode = (String)v;return;}
		if (i == 2){companyCode = (String)v;return;}
		if (i == 3){riskType = (String)v;return;}
		if (i == 4){rate = (String)v;return;}
		if (i == 5){remark1 = (String)v;return;}
		if (i == 6){remark2 = (String)v;return;}
		if (i == 7){remark3 = (String)v;return;}
		if (i == 8){userBranchInnercode = (String)v;return;}
		if (i == 9){createDate = (Date)v;return;}
		if (i == 10){createUser = (String)v;return;}
		if (i == 11){modifyDate = (Date)v;return;}
		if (i == 12){modifyUser = (String)v;return;}
	}

	public Object getV(int i) {
		if (i == 0){return id;}
		if (i == 1){return branchInnercode;}
		if (i == 2){return companyCode;}
		if (i == 3){return riskType;}
		if (i == 4){return rate;}
		if (i == 5){return remark1;}
		if (i == 6){return remark2;}
		if (i == 7){return remark3;}
		if (i == 8){return userBranchInnercode;}
		if (i == 9){return createDate;}
		if (i == 10){return createUser;}
		if (i == 11){return modifyDate;}
		if (i == 12){return modifyUser;}
		return null;
	}

	/**
	* 获取字段id的值，该字段的<br>
	* 字段名称 :ID<br>
	* 数据类型 :varchar(32)<br>
	* 是否主键 :true<br>
	* 是否必填 :true<br>
	*/
	public String getid() {
		return id;
	}

	/**
	* 设置字段id的值，该字段的<br>
	* 字段名称 :ID<br>
	* 数据类型 :varchar(32)<br>
	* 是否主键 :true<br>
	* 是否必填 :true<br>
	*/
	public void setid(String id) {
		this.id = id;
    }

	/**
	* 获取字段branchInnercode的值，该字段的<br>
	* 字段名称 :机构编码<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public String getbranchInnercode() {
		return branchInnercode;
	}

	/**
	* 设置字段branchInnercode的值，该字段的<br>
	* 字段名称 :机构编码<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public void setbranchInnercode(String branchInnercode) {
		this.branchInnercode = branchInnercode;
    }

	/**
	* 获取字段companyCode的值，该字段的<br>
	* 字段名称 :保险公司编码<br>
	* 数据类型 :varchar(20)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public String getcompanyCode() {
		return companyCode;
	}

	/**
	* 设置字段companyCode的值，该字段的<br>
	* 字段名称 :保险公司编码<br>
	* 数据类型 :varchar(20)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public void setcompanyCode(String companyCode) {
		this.companyCode = companyCode;
    }

	/**
	* 获取字段riskType的值，该字段的<br>
	* 字段名称 :险种<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public String getriskType() {
		return riskType;
	}

	/**
	* 设置字段riskType的值，该字段的<br>
	* 字段名称 :险种<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public void setriskType(String riskType) {
		this.riskType = riskType;
    }

	/**
	* 获取字段rate的值，该字段的<br>
	* 字段名称 :费率<br>
	* 数据类型 :varchar(10)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public String getrate() {
		return rate;
	}

	/**
	* 设置字段rate的值，该字段的<br>
	* 字段名称 :费率<br>
	* 数据类型 :varchar(10)<br>
	* 是否主键 :false<br>
	* 是否必填 :true<br>
	*/
	public void setrate(String rate) {
		this.rate = rate;
    }

	/**
	* 获取字段remark1的值，该字段的<br>
	* 字段名称 :备用字段1<br>
	* 数据类型 :varchar(255)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public String getremark1() {
		return remark1;
	}

	/**
	* 设置字段remark1的值，该字段的<br>
	* 字段名称 :备用字段1<br>
	* 数据类型 :varchar(255)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setremark1(String remark1) {
		this.remark1 = remark1;
    }

	/**
	* 获取字段remark2的值，该字段的<br>
	* 字段名称 :备用字段2<br>
	* 数据类型 :varchar(255)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public String getremark2() {
		return remark2;
	}

	/**
	* 设置字段remark2的值，该字段的<br>
	* 字段名称 :备用字段2<br>
	* 数据类型 :varchar(255)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setremark2(String remark2) {
		this.remark2 = remark2;
    }

	/**
	* 获取字段remark3的值，该字段的<br>
	* 字段名称 :备用字段3<br>
	* 数据类型 :varchar(255)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public String getremark3() {
		return remark3;
	}

	/**
	* 设置字段remark3的值，该字段的<br>
	* 字段名称 :备用字段3<br>
	* 数据类型 :varchar(255)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setremark3(String remark3) {
		this.remark3 = remark3;
    }

	/**
	* 获取字段userBranchInnercode的值，该字段的<br>
	* 字段名称 :用户所属机构<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public String getuserBranchInnercode() {
		return userBranchInnercode;
	}

	/**
	* 设置字段userBranchInnercode的值，该字段的<br>
	* 字段名称 :用户所属机构<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setuserBranchInnercode(String userBranchInnercode) {
		this.userBranchInnercode = userBranchInnercode;
    }

	/**
	* 获取字段createDate的值，该字段的<br>
	* 字段名称 :创建时间<br>
	* 数据类型 :datetime<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public Date getcreateDate() {
		return createDate;
	}

	/**
	* 设置字段createDate的值，该字段的<br>
	* 字段名称 :创建时间<br>
	* 数据类型 :datetime<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setcreateDate(Date createDate) {
		this.createDate = createDate;
    }

	/**
	* 获取字段createUser的值，该字段的<br>
	* 字段名称 :创建人<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public String getcreateUser() {
		return createUser;
	}

	/**
	* 设置字段createUser的值，该字段的<br>
	* 字段名称 :创建人<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setcreateUser(String createUser) {
		this.createUser = createUser;
    }

	/**
	* 获取字段modifyDate的值，该字段的<br>
	* 字段名称 :修改时间<br>
	* 数据类型 :datetime<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public Date getmodifyDate() {
		return modifyDate;
	}

	/**
	* 设置字段modifyDate的值，该字段的<br>
	* 字段名称 :修改时间<br>
	* 数据类型 :datetime<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setmodifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
    }

	/**
	* 获取字段modifyUser的值，该字段的<br>
	* 字段名称 :修改人<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public String getmodifyUser() {
		return modifyUser;
	}

	/**
	* 设置字段modifyUser的值，该字段的<br>
	* 字段名称 :修改人<br>
	* 数据类型 :varchar(100)<br>
	* 是否主键 :false<br>
	* 是否必填 :false<br>
	*/
	public void setmodifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
    }

}