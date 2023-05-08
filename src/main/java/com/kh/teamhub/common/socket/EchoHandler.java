package com.kh.teamhub.common.socket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.teamhub.alram.domain.Alram;
import com.kh.teamhub.alram.store.AlramStore;
import com.kh.teamhub.user.domain.User;


public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	private AlramStore aStore;
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info("현재접속한사람" + currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		logger.info("로그 msg : "+msg);
//		msg 등록
		if(msg != null && !msg.equals("")) {  // msg가 null이 아니고 길이가 0이 아닌지 확인
			String[] strs = msg.split(",");
			System.out.println("길이 : " + strs.length);
			if(strs.length == 4) {
				String userId = strs[0];
				String alramKind = strs[1];
				String alramContent = strs[2];
				String alramUrl = strs[3];
				Alram alram = new Alram(userId, alramKind, alramContent, alramUrl);
				System.out.println("알람등록: " + alram);
				aStore.insertAlram(alram);
			}
		}	
//		리스트 가져오기 
		for(WebSocketSession single : sessions) {
			User user = (User) single.getAttributes().get("user");
			String hsid = user.getUserId();
			System.out.println("세션비교:"+hsid+currentUserName(session));
			
			if(hsid.equals(currentUserName(session))) {
				{				//체크 안된 알림들만 담아서 View
					List<Alram> dto = new ArrayList<>();
					dto = aStore.selectAlram();
					System.out.println("DTO : " + dto);
					for(Alram alram : dto) {
						String sendMsg = null;
						
						Date date = alram.getAlramDate();
						
				        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				        String outputDateString = outputDateFormat.format(date);
						
						if(alram.getUserId().equals(hsid)) {
							// green,blue,orange,red
							if(alram.getAlramKind().equals("전자결재")) {
								// [전자결재] '기안서작성'이(가) 반려되었습니다. 승인되었습니다.
//								sendMsg = "["+alram.getAlramKind()+"] " + alram.getAlramContent(); 	
								sendMsg = "<a onclick='checkAlram("+alram.getAlramNo()+");' href='"+alram.getAlramUrl()+"'><span style='color: blue;'>["+alram.getAlramKind()+"]</span> " + alram.getAlramContent() + "</a>" + "<p>"+outputDateString+"</p>";
							} else if(alram.getAlramKind().equals("댓글")) {
								// !!!!! 컨텐츠에 댓글 작성한 사람의 이름이 대신 들어감. !!!!!
								// [댓글] '김하얀'님이 댓글을 작성하셨습니다.
//						    	sendMsg = "["+alram.getAlramKind()+"] " + alram.getAlramContent() + "님이 댓글을 작성하셨습니다.";
								sendMsg = "<a onclick='checkAlram("+alram.getAlramNo()+");' href='"+alram.getAlramUrl()+"'><span style='color: orange;'>["+alram.getAlramKind()+"]</span> " + "'"+alram.getAlramContent() + "'" + "님이 댓글을 작성했습니다." + "</a>" + "<p>"+outputDateString+"</p>";
							}
						} else if(alram.getAlramKind().equals("공지사항")) {
							// [공지사항] '공지제목'
							sendMsg = "<a onclick='checkAlram("+alram.getAlramNo()+");' href='"+alram.getAlramUrl()+"'><span style='color: red;'>["+alram.getAlramKind()+"]</span> " + alram.getAlramContent() + "</a>" + "<p>"+outputDateString+"</p>";
						} else if(alram.getAlramKind().equals("일정")) {
							// [일정] '일정이름' 일정 하루 전입니다.
//							sendMsg = "["+alram.getAlramKind()+"] " + "'"+ alram.getAlramContent()+"'"+" 일정 하루 전입니다.";
							sendMsg = "<a onclick='checkAlram("+alram.getAlramNo()+");' href='"+alram.getAlramUrl()+"'><span style='color: green;'>["+"전사"+alram.getAlramKind()+"]</span> " + alram.getAlramContent() + "</a>" + "<p>"+outputDateString+"</p>";
						}
						if(sendMsg == null) {
							continue;
						}
						
						System.out.println("@@@@알람: " + alram);
						TextMessage msg2 = new TextMessage(sendMsg);
						single.sendMessage(msg2);
					}
				}
			}
			
			
		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("user");
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getUserId();
		return mid;
		
	}
}
	
