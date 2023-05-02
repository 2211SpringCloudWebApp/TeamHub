package com.kh.teamhub.todo.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.teamhub.todo.domain.Memo;
import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.user.domain.User;

public interface TodoStore {

	/**
	 * 할 일 등록
	 * @param session
	 * @param todo
	 * @return int
	 */
	int insertTodo(SqlSession session, Todo todo);

	/**
	 * 할 일 리스트
	 * @param user
	 * @return List<Todo>
	 */
	List<Todo> selectTodoList(SqlSession session, User user);

	/**
	 * IS_FINISHED 업데이트
	 * @param todoNo
	 * @return int
	 */
	int updateFinish(SqlSession session, int todoNo);

	/**
	 * 업데이트한 todo select
	 * @param todoNo
	 * @return Todo
	 */
	Todo selectUpdateTodo(SqlSession session, int todoNo);

	/**
	 * todo 삭제
	 * @param todoNo
	 * @return int
	 */
	int deleteTodo(SqlSession session, int todoNo);

	List<Todo> selectDayList(SqlSession session, Todo todo);

	List<Todo> selectEvents(SqlSession session, String userId);

	/**
	 * 메모 등록
	 * @param memo
	 * @return int
	 */
	int insertMemo(SqlSession session, Memo memo);

	/**
	 * 메모 리스트
	 * @param session
	 * @param userId
	 * @return List<Memo>
	 */
	List<Memo> selectMemoList(SqlSession session, String userId);

	/**
	 * 메모 삭제
	 * @param session
	 * @param memoNo
	 * @return int
	 */
	int deleteMemo(SqlSession session, int memoNo);


}
