package com.kh.teamhub.attendance.domain;

public class AttenCount {
	private int late;
	private int leaveEarly;
	private int goToWork;
	
	public AttenCount(int late, int leaveEarly, int goToWork) {
		super();
		this.late = late;
		this.leaveEarly = leaveEarly;
		this.goToWork = goToWork;
	}

	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getLeaveEarly() {
		return leaveEarly;
	}

	public void setLeaveEarly(int leaveEarly) {
		this.leaveEarly = leaveEarly;
	}

	public int getGoToWork() {
		return goToWork;
	}

	public void setGoToWork(int goToWork) {
		this.goToWork = goToWork;
	}

	@Override
	public String toString() {
		return "AttenCount [late=" + late + ", leaveEarly=" + leaveEarly + ", goToWork=" + goToWork + "]";
	}
	
}
