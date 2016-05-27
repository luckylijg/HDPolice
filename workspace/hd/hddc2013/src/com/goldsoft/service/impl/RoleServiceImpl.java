package com.goldsoft.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.goldsoft.dao.ModuleDAO;
import com.goldsoft.dao.RoleDAO;
import com.goldsoft.model.Module;
import com.goldsoft.model.Role;
import com.goldsoft.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	@Qualifier("roleDAOImpl")
	private RoleDAO roleDAO;
	@Autowired
	@Qualifier("moduleDAOImpl")
	private ModuleDAO moduleDAO;
	@Override
	public List<Role> list() {
		
		return this.roleDAO.list();
	}

	@Override
	public Role get(int roleid) {
		
		Role role= this.roleDAO.get(roleid);
		//System.out.println("roleserviceimpl"+role.getDescription());
		return role;
	}

	@Override
	public void add(Role role) {
		this.roleDAO.add(role);

	}

	@Override
	public void update(Role role) {
		this.roleDAO.update(role);

	}

	@Override
	public void delete(int roleid) {
		this.roleDAO.delete(roleid);

	}

	@Override
	public List<String> getModuleid(int roleid) {
		Role role=this.roleDAO.get(roleid);
		List<String> list=new ArrayList<String>();
		for(Module module:role.getModules()){
			list.add(module.getModuleid());
		}
		return list;
	}

	@Override
	public void addModuleToRole(int roleid, String moduleid) {
		//System.out.println("roleServiceImpl1111111");
		Role role =this.roleDAO.get(roleid);
		Module module=this.moduleDAO.get(moduleid);

		//System.out.println("roleServiceImpl44444444444");
		/*Set set=module.getRoles();
		//System.out.println("555555555555");
		if(set.contains(role)){
			set.remove(role);
		}else{
			set.add(role);
		}
		module.setRoles(set);
		//System.out.println("roleServiceImpl33333333333");
		this.moduleDAO.update(module);
		//System.out.println("roleServiceImpl2222222222");*/
		//System.out.println("roleserviceimpladdModuleToRole"+module.getModuleid()+"         "+role.getDescription());
		Set set=role.getModules();
		//System.out.println("555555555555");
		if(set.contains(module)){
			set.remove(module);
		}else{
			set.add(module);
		}
		role.setModules(set);
		//System.out.println("roleServiceImpl33333333333");
		this.roleDAO.update(role);
		//System.out.println("roleServiceImpl2222222222");
	}

}
