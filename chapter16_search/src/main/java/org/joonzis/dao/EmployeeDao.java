package org.joonzis.dao;

import java.util.List;
import java.util.Map;

import org.joonzis.vo.EmployeeVO;

public interface EmployeeDao {
	public List<EmployeeVO> getAll();
	public List<EmployeeVO> getDept(int deptId);
	public List<EmployeeVO> getDynamic(Map<String, String> map);
}
