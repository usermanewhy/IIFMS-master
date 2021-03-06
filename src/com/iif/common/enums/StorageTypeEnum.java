package com.iif.common.enums;

import java.util.LinkedHashMap;

import com.iif.common.util.RedisUtil;

/**
 * 
 * 存储类型枚举
 * @author LiuM
 * @version V0.1
 * @date 2017
 */
public class StorageTypeEnum {
	static final public int TYPE1 = 1;// 存储区
	static final public int TYPE2 = 2;// 密集柜/区

	// 此名固定，不可修改
	@SuppressWarnings("rawtypes")
	public LinkedHashMap enumMap;

	@SuppressWarnings("rawtypes")
	public LinkedHashMap getEnumMap() {
		return enumMap;
	}

	// jsp中按照类似"value=0 text=全部"的规则来操作
	@SuppressWarnings("rawtypes")
	public StorageTypeEnum() {
		enumMap = new LinkedHashMap();
		RedisUtil.putEnumMap(enumMap, this);
	}
}
