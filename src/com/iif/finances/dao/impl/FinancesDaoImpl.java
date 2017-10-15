package com.iif.finances.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.hxjz.common.core.SpringTool;
import com.hxjz.common.core.orm.BaseDao;
import com.hxjz.common.utils.DateUtil;
import com.hxjz.common.utils.Page;
import com.iif.common.util.SysConstant;
import com.iif.finances.dao.IFinancesDao;
import com.iif.finances.entity.FinancesImages;

/**
 * @Author GaoGang
 * @Date 2017年5月15日 下午10:31:07
 * @Version V0.1
 * @Desc 财物管理 daoImpl
 */
@Repository
public class FinancesDaoImpl extends BaseDao implements IFinancesDao {

    @Override
    public List showStatistics(Page page, Map conditions) throws ParseException {
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("select  tf.ffinanceType as type, td.fvalue as typeName,count(tf.fid) as total ");
        sqlBuilder.append(" from tfinances tf,tdictionary td");
        sqlBuilder.append(" where 1=1");
        Object[] params = new Object[conditions.size()];
        int i = 0;
        if (!conditions.isEmpty()) {
            // 查询条件组装
            for (Object key : conditions.keySet()) {
                if (key.toString().contains("GE")) {
                    sqlBuilder.append(" and tf.fupdateTime>=?");
                } else {
                    sqlBuilder.append(" and tf.fupdateTime<=?");
                }
                params[i] = DateUtil.convertStringToDate(conditions.get(key).toString());
                i++;
            }
        }
        sqlBuilder.append(" and tf.ffinanceType = td.fkey");
        sqlBuilder.append(" and tf.ffinanceState = 2");      
        sqlBuilder.append(" and tf.fisdel = "+ SysConstant.SYSTEM_CON_ZER);
        sqlBuilder.append(" and td.fenumname = 'FinanceTypeEnum'");
        sqlBuilder.append(" group by tf.ffinanceType");
        System.out.println(sqlBuilder.toString());
        List<Map<String, Object>> statisticList = new ArrayList<Map<String, Object>>();

        JdbcDaoSupport dao = (JdbcDaoSupport) SpringTool.getBean("JdbcDaoSupport");
        List resultList = dao.getJdbcTemplate().query(sqlBuilder.toString(), params, new FinancesDaoImpl.FinanceStatisticsMapper());

        statisticList.addAll(resultList);
        return statisticList;
    }
    
    protected static class FinanceStatisticsMapper implements RowMapper<Object> {
    	@Override
    	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("typeName", rs.getString("typeName"));
            result.put("total", rs.getInt("total"));
            return result;
        }
    }
    @Override
    @SuppressWarnings("unchecked")
    public List<FinancesImages> findFinancesImagesList(String id){
    	SessionFactory sf=this.getHibernateTemplate().getSessionFactory();
    	Session si=sf.getCurrentSession();
    	Query q=si.createQuery("from FinancesImages f where f.financeId=:fid");
    	q.setString("fid", id);
		List<FinancesImages> list=q.list();
    	return list;
    }

	@Override
	public String removeFinancesImages(String[] imgId) {
		// TODO removeFinancesImages
		SessionFactory sf=this.getHibernateTemplate().getSessionFactory();
    	Session si=sf.getCurrentSession();
	    try {
	    	Query q=si.createQuery("delete FinancesImages f where f.id in (:fid)");
	    	System.out.println(q.toString());
	    	q.setParameterList("fid",imgId);
	    	int dd = q.executeUpdate();
	    	return "true";	
		} catch (Exception e) {
			return "false";
		}
	
	}
}
