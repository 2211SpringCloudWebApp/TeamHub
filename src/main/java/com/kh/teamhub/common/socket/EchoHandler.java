package com.kh.teamhub.common.socket;

import java.util.ArrayList;
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
					
					for(Alram alram : dto) {
						System.out.println("알람리스트:" + alram);
						String sendMsg = null;
						
						if(alram.getUserId().equals(hsid)) {
							
							if(alram.getAlramKind().equals("일정")) {
								// [일정] '일정이름' 일정 하루 전입니다.
								sendMsg = "["+alram.getAlramKind()+"] " + "'"+ alram.getAlramContent()+"'"+" 일정 하루 전입니다.";
								
							} else if(alram.getAlramKind().equals("전자결재")) {
								// [전자결재] '기안서작성'이(가) 반려되었습니다. 승인되었습니다.
								sendMsg = "["+alram.getAlramKind()+"] " + alram.getAlramContent();
								
							} else if(alram.getAlramKind().equals("댓글")) {
								// !!!!! 컨텐츠에 댓글 작성한 사람의 이름이 대신 들어감. !!!!!
								// [댓글] '김하얀'님이 댓글을 작성하셨습니다.
						    	sendMsg = "["+alram.getAlramKind()+"] " + alram.getAlramContent() + "님이 댓글을 작성하셨습니다.";
							}
						} else if(alram.getAlramKind().equals("공지사항")) {
							// [공지사항] '공지제목'
							sendMsg = "["+alram.getAlramKind()+"] " + alram.getAlramContent();
						}
						if(sendMsg == null) {
							continue;
						}
						TextMessage msg2 = new TextMessage(sendMsg);
						single.sendMessage(msg2);
					}
				}
			}
			
			
		}
		
//			String[] strs = msg.split(",");
//			if(strs != null && strs.length == 6) {
//				
//				String cmd = strs[0];
//				String replyWriter = strs[1];
//				String boardWriter = strs[2];
//				String bno = strs[3];
//				String title = strs[4];
//				String bgno = strs[5];
//				logger.info("length 성공?"+cmd);
//				
//				WebSocketSession replyWriterSession = userSessionsMap.get(replyWriter);
//				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter);
//				logger.info("boardWriterSession="+userSessionsMap.get(boardWriter));
//				logger.info("boardWirterSession"+boardWriterSession);
//				
//				//댓글
//				if ("reply".equals(cmd) && boardWriterSession != null) {
//					logger.info("onmessage되나?");
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno="+ bno +"&bgno="+bgno+"'  style=\"color: black\">"
//							+ title+" 에 댓글을 달았습니다!</a>");
//					boardWriterSession.sendMessage(tmpMsg);
//				}
//				
//				//스크랩
//				else if("scrap".equals(cmd) && boardWriterSession != null) {
//					//replyWriter = 스크랩누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 스크랩했습니다!</a>");
//
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//좋아요
//				else if("like".equals(cmd) && boardWriterSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 좋아요했습니다!</a>");
//
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//DEV
//				else if("Dev".equals(cmd) && boardWriterSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 DEV했습니다!</a>");
//
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//댓글채택
//				else if("questionCheck".equals(cmd) && replyWriterSession != null) {
//					//replyWriter = 댓글작성자 , boardWriter = 글작성자
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 채택했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//댓글좋아요
//				else if("commentLike".equals(cmd) && replyWriterSession != null) {
//					logger.info("좋아요onmessage되나?");
//					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 추천했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
//				
//				
//				//댓글DEV
//				else if("commentDev".equals(cmd) && replyWriterSession != null) {
//					logger.info("좋아요onmessage되나?");
//					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 DEV했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
//				
//				
//					
//				
//			}
//			
		
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
	
