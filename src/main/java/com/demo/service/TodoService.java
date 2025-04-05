package com.demo.service;

import java.util.List;

import com.demo.model.Todo;

public interface TodoService 
{
	Todo save(Todo t);
	
	List<Todo> findAll();
	
	int deleteById(int id);
}
