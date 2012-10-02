package com.sysquare.ims.core.dao;

import java.util.List;

import com.sysquare.ims.model.domain.User;

public interface UserDAO {
	
	void addUser(User user);
	List<User> listUser(User adminUser);
	void removeUser(Integer id);
	User findByEmail(String email, Integer excludeId);
    User findByEmailAndPassword(String email, String password);
    User findById(Integer id);
    User findByUsername(String username);
    void updateUser(User user);
}
