package com.kh.teamhub.todo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamhub.todo.domain.Memo;
import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.user.domain.User;

@Repository
public class TodoStoreLogic implements TodoStore{

	@Override
	public int insertTodo(SqlSession session, Todo todo) {
		int result = session.insert("TodoMapper.insertTodo", todo);
		return result;
	}

	@Override
	public List<Todo> selectTodoList(SqlSession session, User user) {
		List<Todo> tList = session.selectList("TodoMapper.selectTodoList", user);
		return tList;
	}

	@Override
	public int updateFinish(SqlSession session, int todoNo) {
		int result = session.update("TodoMapper.updateFinish", todoNo);
		return result;
	}

	@Override
	public Todo selectUpdateTodo(SqlSession session, int todoNo) {
		Todo todo = session.selectOne("TodoMapper.selectUpdateTodo", todoNo);
		return todo;
	}

	@Override
	public int deleteTodo(SqlSession session, int todoNo) {
		int result = session.delete("TodoMapper.deleteTodo", todoNo);
		return result;
	}

	@Override
	public List<Todo> selectDayList(SqlSession session, Todo todo) {
		List<Todo> tList = session.selectList("TodoMapper.selectDayList", todo);
		return tList;
	}

	@Override
	public List<Todo> selectEvents(SqlSession session, String userId) {
		List<Todo> tList = session.selectList("TodoMapper.selectEvents", userId);
		return tList;
	}

	@Override
	public int insertMemo(SqlSession session, Memo memo) {
		int result = session.insert("MemoMapper.insertMemo", memo);
		return result;
	}

	@Override
	public List<Memo> selectMemoList(SqlSession session, String userId) {
		List<Memo> mList = session.selectList("MemoMapper.selectMemoList", userId);
		return mList;
	}

	@Override
	public int deleteMemo(SqlSession session, int memoNo) {
		int result = session.delete("MemoMapper.deleteMemo", memoNo);
		return result;
	}


}
