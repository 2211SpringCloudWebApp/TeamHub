package com.kh.teamhub.todo.service;

import java.util.List;

import com.kh.teamhub.todo.domain.Memo;
import com.kh.teamhub.todo.domain.Todo;
import com.kh.teamhub.user.domain.User;

public interface TodoService {

	/**
	 * 할 일 등록
	 * @param todo
	 * @return int
	 */
	int insertTodo(Todo todo);

	/**
	 * 할 일 리스트
	 * @param user
	 * @return List<Todo>
	 */
	List<Todo> selectTodoList(User user);

	/**
	 * IS_FINISHED 업데이트
	 * @param todoNo
	 * @return int
	 */
	int updateFinish(int todoNo);

	/**
	 * 업데이트한 todo select
	 * @param todoNo
	 * @return Todo
	 */
	Todo selectUpdateTodo(int todoNo);

	/**
	 * todo 삭제
	 * @param todoNo
	 * @return int
	 */
	int deleteTodo(int todoNo);

	List<Todo> selectDayList(Todo todo);

	List<Todo> selectEvents(String userId);

	/**
	 * 메모 등록
	 * @param memo
	 * @return int
	 */
	int insertMemo(Memo memo);

	/**
	 * 메모 리스트
	 * @param userId
	 * @return List<Memo>
	 */
	List<Memo> selectMemoList(String userId);

	/**
	 * 메모 삭제
	 * @param memoNo
	 * @return int
	 */
	int deleteMemo(int memoNo);


}
