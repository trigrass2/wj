package cn.com.sinosoft.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


import cn.com.sinosoft.dao.SCQuestionDao;
import cn.com.sinosoft.entity.QueryWGQ;
import cn.com.sinosoft.entity.SCQuestion;
/**
 * 
 * @author wugq
 *
 */

@Repository
public class SCQuestionDaoImpl extends BaseDaoImpl<SCQuestion, String>
		implements SCQuestionDao {}