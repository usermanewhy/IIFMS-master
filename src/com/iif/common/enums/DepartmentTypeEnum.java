package com.iif.common.enums;

import java.util.LinkedHashMap;

import com.iif.common.util.RedisUtil;

/**
 * 报送/取物单位类型枚举
 * @author M
 * @version V0.1
 * @date 2017
 */
public class DepartmentTypeEnum {
	static final public int TYPE1 = 1;// 县局
	static final public int TYPE2 = 2;// 市局
	static final public int TYPE3 = 3;// 
	static final public int TYPE4 = 4;// 
	static final public int TYPE5 = 5;// 

	// 此名固定，不可修改
	@SuppressWarnings("rawtypes")
	public LinkedHashMap enumMap;

	@SuppressWarnings("rawtypes")
	public LinkedHashMap getEnumMap() {
		return enumMap;
	}

	// jsp中按照类似"value=0 text=全部"的规则来操作
	@SuppressWarnings("rawtypes")
	public DepartmentTypeEnum() {
		enumMap = new LinkedHashMap();
		RedisUtil.putEnumMap(enumMap, this);
	}
}
