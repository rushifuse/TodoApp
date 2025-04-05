package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.demo.model.Todo;

@Repository
public interface TodoDao extends JpaRepository<Todo, Integer>
{
	Todo save(Todo t);
	
	List<Todo> findAll();
	
	@Query(value = "delete from Todo where id =?1")
	@Modifying
	int deleteById(int id);
}
