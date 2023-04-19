package com.kh.teamhub.schedule.service;

import java.util.Collection;

import com.kh.teamhub.schedule.domain.Schedule;

public interface ScheduleService {

	int insertSchedule(Schedule schedule);

	Collection<? extends Schedule> getAllEvents();

	Collection<? extends Schedule> getDepartmentEvents(String deptName);

	Collection<? extends Schedule> getPersonalEvents(String userId);


}
