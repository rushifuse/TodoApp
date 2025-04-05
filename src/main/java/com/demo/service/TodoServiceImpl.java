package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.TodoDao;
import com.demo.model.Todo;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class TodoServiceImpl implements TodoService
{
	@Autowired
	private TodoDao td;

	@Override
	public List<Todo> findAll() {
		return td.findAll();
	}

	@Override
	public Todo save(Todo t) {
		return td.save(t);
	}

	@Override
	public int deleteById(int id) {
		return td.deleteById(id);
	}
}
