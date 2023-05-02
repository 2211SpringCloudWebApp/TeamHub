package com.kh.teamhub.todo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.todo.store.TodoStore;
import com.kh.teamhub.user.domain.User;

@Service
public class TodoServiceImpl implements TodoService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private TodoStore tStore;

	@Override
	public int insertTodo(Todo todo) {
		int result = tStore.insertTodo(session, todo);
		return result;
	}

	@Override
	public List<Todo> selectTodoList(User user) {
		List<Todo> tList = tStore.selectTodoList(session, user);
		return tList;
	}

	@Override
	public int updateFinish(int todoNo) {
		int result = tStore.updateFinish(session, todoNo);
		return result;
	}

	@Override
	public Todo selectUpdateTodo(int todoNo) {
		Todo todo = tStore.selectUpdateTodo(session, todoNo);
		return todo;
	}

	@Override
	public int deleteTodo(int todoNo) {
		int result = tStore.deleteTodo(session, todoNo);
		return result;
	}

	@Override
	public List<Todo> selectDayList(Todo todo) {
		List<Todo> tList = tStore.selectDayList(session, todo);
		return tList;
	}

	@Override
	public List<Todo> selectEvents(String userId) {
		List<Todo> tList = tStore.selectEvents(session, userId);
		return tList;
	}


}
