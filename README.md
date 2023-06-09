
<img width="600" alt="logo" src="https://user-images.githubusercontent.com/119032800/236744123-0bb08217-8336-437f-9d89-30708346a7dc.png">

# TeamHub : 

필수적인 기능만 담아 협업의 효율성을 높인 비즈니스 그룹웨어 플랫폼


## 프로젝트 목적

재택근무 및 비대면 업무가 활성화 되어가고 있는 시대 흐름에 맞추어

중소기업을 대상으로 꼭 필요한 기능만을 담아

비용 부담은 낮추고 직관적이고 간편한 사용으로 협업의 효율성은 높인 비즈니스 그룹웨어
</br>

## 팀원 및 역할분담
협업해조 : 협업 그룹웨어 제작을 위해 팀원들끼리 성공적으로 협업 해 보자는 긍정적인 의미

<img width="500" alt="image" src="https://user-images.githubusercontent.com/119032800/236745945-7f09deeb-adbe-4c50-828d-8d15f0c7165b.png">


## 개발환경
<img width="500" alt="image" src="https://user-images.githubusercontent.com/119032800/236772442-35f3d0b9-62b4-4932-9e12-15a9aacb5dc1.png">

Category | Detail
:-------:|:---:
FrontEnd | HTML5, JS, CSS3, JQuery
BackEnd | Java(JDK 11), Servlet, Spring(5.2.18), Mybatis
OS | Windows 10
Libray&API | JSTL, Fullcalendar
IDE | STS(3.9.12.RELEASE), VisualStudio, SQL Developer
Server | Apache Tomcat 9
DateBase | ORACLE(21.3.0.0.0)
Document | Google Drive, ERDCloud, diagrams.net, Slack, Notion, Figma
CI | Github

## 주요기능

### 메인
기능명 | 상세
:--------|-----
메인 | 로그인을 성공하면 사용자는 프로필 사진, 이름, 아이디, 비밀번호, 부서, 직급, 연락처, 이메일, 생년월일을 확인할 수 있다. 사용자가 자신의 정보를 변경해야 할 때 비밀번호 재 설정, 연락처, 이메일 수정을 할 수 있다. 로그인된 사용자에 한하여 가능하다.

### 근태관리
기능명 | 상세
:--------|-----
출퇴근 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 로그인한 사용자는 출,퇴근 시 자신의 근태 관리를 확인 할 수 있다. </br>출근, 퇴근 버튼을 클릭하면 현재 시간이 입력된다. 구분으로는 출근, 지각, 조퇴, 결근이 있다. 오전 9시전에 출근 버튼을 누를 시 출근, 오전 9시 이후에 출근 버튼을 누를 시 지각, 오후 6시전에 퇴근 버튼을 누를 시 조퇴, 해당 일의 출근이 없을시 결근으로 처리된다. 근태 리스트는 월별로 조회 가능하다. </br>당일의 출근 버튼을 두번 누를 경우 에러메세지가 출력된다. 출근과 퇴근 시간을 계산해 근무시간을 출력한다.
연차관리|사용자는 연도를 선택해 해당 연도에 해당하는 총 연차, 사용 연차, 잔여 연차, 사용한 연차 내역을 확인할 수 있으며 연차 신청을 할 수 있다.

### 일정관리
기능명 | 상세
:--------|-----
일정 관리 | 사용자는 캘린더에서 일정을 월간, 주간, 일간 형태로 조회가 가능하며 전사 일정을 제외한 부서 일정, 개인 일정을 추가, 수정, 삭제 할 수 있다. 일정의 수정과 삭제는 본인이 작성한 일정만 가능하다. </br> 세부 사이드바에 있는 전사 일정, 부서 일정, 개인 일정 체크 선택시 해당 일정만 확인할 수 있다. </br>사용자가 일정을 추가하는 방법으로는 원하는 날짜를 선택, 드래그앤 드랍, 일정추가 버튼 클릭으로 일정을 등록할 수 있으며 모달창에서 상세 내용을 입력할 수 있다. </br>상세 내용에서 일정 명, 색 선택,시작 날짜(연, 월, 일), 종료 날짜 (연, 월, 일), 일정 구분, 장소, 내용, 알림 여부를 입력한다. </br>일정 구분에서 관리자가 아닐 경우 개인 일정, 부서 일정만 선택 가능하다. </br>알림 여부에는 일정 전날 알림이 있으며 체크 선택 또는 해제할 수 있다.

### 업무관리
기능명 | 상세
:-------|-----
할 일 목록&nbsp;&nbsp;&nbsp;&nbsp;| 사용자는 업무 관리에서 할 일, 달력, 메모를 확인할 수 있다. 사용자는 할 일 목록을 등록, 삭제 할 수 있으며 달력에서 업무가 등록된 해당 일을 선택시 해당 일의 작성한 할 일 목록을 확인할 수 있으며, 달력에서 날짜를 클릭하면 해당 날짜에 할 일 등록이 가능하다.  작성한 할 일은 체크 박스 선택시 완료처리 시킬 수 있다.
메모| 사용자는 메모를 등록, 삭제 할 수 있으며 메모 목록은 날짜가 바뀌더라도 항상 고정되어있다.

### 사원관리
기능명 | 상세
:-------|-----
사원관리 | 사용자는 사원들의 정보를 리스트 형식으로 확인할 수 있다. </br> 페이징 처리가 되어있으며 부서, 직급, 이름으로 조건부 검색이 가능하다. </br>사용자는 사원정보 중 사원번호, 이름, 부서, 직급, 이메일, 전화번호를 확인할 수 있다.
조직도 | 사용자는 부서, 직급으로 이루어진 계층을 확인할 수 있다. 해당하는 사원들의 목록이 직급 순으로 출력되며 사원 선택시 사원의 프로필 사진, 이름, 부서, 직급, 이메일, 연락처, 생년월일을 확인 할 수 있다.

### 프로젝트
기능명 | 상세
:-------|-----
프로젝트 | 사용자는 프로젝트를 생성할 때 프로젝트명, 담당자, 시작 날짜(연, 월, 일), 종료날짜 (연, 월, 일)을 입력한다.</br>담당자는 프로젝트를 생성하는 사람의 이름이 입력되며 수정 할 수 없다.</br>세부 사이드바에는 전체 보기, 진행 중인 프로젝트, 종료된 프로젝트 목록이 있다.</br>진행중인 프로젝트에서는 그룹웨어 내에서 진행중인 모든 프로젝트를 확인할 수 있고 종료된 프로젝트에서는 그룹웨어 내에서 종료된 모든 프로젝트를 확인할 수 있다.</br>프로젝트 목록은 테이블 형식으로 출력하며 칼럼에는 번호, 프로젝트명, 담당자, 시작일, 종료일, 상태가 있으며 상태에는 진행 중, 종료 2가지가 있다. 사용자가 프로젝트명을 클릭 할 시 프로젝트 상세 보기로 이동한다.</br>프로젝트 상세 보기에서는 프로젝트 정보, 칸반 보드, 프로젝트 진행률을 확인할 수 있다.</br>프로젝트 정보는 생성할 때 입력했던 정보를 확인할 수 있으며 프로젝트 담당자만 수정이 가능하다.</br>칸반 보드에서는 진행 상태를 확인할 수 있으며 항목으로는 진행 사항 없음, 시작 전, 진행 중, 완료,취소가 있다.</br>입력을 원할시 추가 버튼을 클릭하고 모달창에 이름과 내용을 입력한다.</br>프로젝트 진행률 에서는 프로그래스 바를 통해 진행률을 확인할 수 있으며 칸반보드의 진행 상태와 각 상태의 개수를 확인할 수 있다.

### 전자결재
기능명 | 상세
:-------|-----
전자결재 | 사용자는 세부 사이드 바에서 기안 문서함, 결재 문서함, 참조 문서함, 임시 저장함 카테고리를 선택할 수 있다.</br>각 카테고리에는 전체, 대기, 진행, 완료, 반려 목록의 진행 상태 네비게이션 바가 있다.</br>사용자는 카테고리를 선택해 진행 상태를 확인할 수 있다. 각 카테고리에선 문서 작성 날짜, 문서 양식, 제목, 문서 번호, 결재 상태를 확인할 수 있고 조건부 검색이 가능하다.</br> 사용자는 결재 상신 버튼을 눌러 모달창에서 문서 양식(기안서, 품의서, 휴가신청서, 지출결의서)을 선택 가능하다.</br>사용자는 결재자, 참조자, 제목, 내용을 입력이 가능하며 결재자의 경우 총 3명까지 선택하고 참조자의 경우 인원 제한 없이 선택이 가능하다. </br>사용자는 임시 저장, 결재 요청, 취소를 선택할 수 있다.</br> 임시 저장을 선택할 경우 임시 저장함으로 작성한 문서가 저장되며 임시 저장함에서 결재 요청, 임시 저장, 결재 요청, 취소 버튼을 선택할 수 있다. 결재 요청을 한 모든 문서는 언제든 상신 취소 할 수 있으며 모든 결재자의 결재 승인이 완료됐을 경우 사용자는 결재 완료 알림을 받는다. 결재 문서가 반려 됐을 경우 반려 사유를 확인 할 수 있고 반려 알림을 받는다. 사용자는 반려된 문서를 수정해 재상신을 요청할 수 있다.</br>사용자는 모든 문서함 카테고리에서 각기 용도에 맞는 문서들을 조회, 수정, 삭제할 수 있다.

### 게시판
기능명 | 상세
:-------|-----
게시판 | 사용자는 자유롭게 의견을 공유할 수 있으며 공지 관련된 내용을 확인할 수 있다. 목록은 테이블 형식으로 이루어지며 칼럼에 제목, 작성자, 작성일, 조회수를 확인할 수 있고 페이징, 조건부 검색이 가능하다. 사용자는 게시글 작성시 제목, 내용, 첨부파일을 등록할 수 있다. 사용자는 목록에서 제목을 선택하여 상세 페이지로 이동이 가능하며 댓글 등록, 대댓글 등록, 수정, 삭제, 신고를 할 수 있다. 공지 게시판은 조회만 가능하다.

### 알림
기능명 | 상세
:-------|-----
알림 | 사용자는 알림 버튼을 클릭하면 읽지 않은 알림의 목록을 볼 수 있고 선택시 관련 페이지로 이동한다. 체크 버튼을 누르면 읽지 않은 알림을 모두 읽음 처리 하고 알림 목록을 삭제한다. 알림의 목록으로는 공지사항, 일정, 댓글, 전자 결재가 있다.

### 관리자
기능명 | 상세
:-------|-----
사원관리 | 관리자는 사원 관리 메뉴에서 사원 조회, 사원 추가를 할 수 있다. 사원 조회에서는 재직자 목록과 퇴직자 목록을 확인 할 수 있으며 사원의 이름으로 검색이 가능하다. 사원을 선택 시 상세 정보를 조회 가능하며 사원의 정보를 수정, 삭제, 퇴직 처리가 가능하다.
근태관리 | 관리자가 모든 사원의 근태를 관리할 수 있는 페이지다. 조건부 검색으로 검색한 사원의 근태를 확인할 수 있다.
연차관리 | 관리자가 모든 사원의 연차를 관리할 수 있는 페이지다. 조건부 검색으로 검색한 사원의 연차 사용 내역을 확인할 수 있다.
프로젝트 | 관리자는 모든 프로젝트의 리스트를 조회, 삭제 할 수 있다.
게시판 | 관리자는 자유 게시판, 공지사항, 신고 게시판의 리스트를 조회, 수정, 삭제 가능하다.</br>관리자는 공지사항 등록시 제목, 내용, 파일을 입력할 수 있으며 등록을 완료 할 경우 모든 사원에게 공지 알림을 전송한다. 관리자는 신고가 들어온 자유 게시판 게시물을 신고 게시판에서 확인할 수 있으며 게시물 클릭시 모달창에서 사원이 신고한 내용을 확인하고 버튼을 클릭해서 신고당한 게시물로 이동 가능하다.</br>관리자는 사원의 게시판 작성 권한을 제한할 수 있다.
일정관리 | 관리자는 전사 일정을 조회, 추가, 수정, 삭제 할 수 있다. 사용자가 이용하는 형태의 캘린더 형식으로 조회가 가능하며 리스트 형식으로도 조회가 가능하다.

## TeamHub 살펴보기

### 1. 메인 화면
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/c2119678-f6ec-466a-addf-f50695244920">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/a613383f-b4b6-40cf-9e68-83e2f7563379">


### 2. 마이페이지
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/54dbd6bd-4e06-4de9-afc3-00d35cda7b51">


### 3. 근태관리
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/80892c6f-8432-45c2-833c-254d32f0c120">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/76762519-ffa6-4618-aafc-fb0647baf8d7">

출근버튼을 누르면 출근, 퇴근버튼을 누르면 퇴근처리


<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/c56e7bda-63ff-4b7c-887d-50f50019bdf0">

월별로 검색가능

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/152f2c13-7d7a-4ef2-a300-19a76a04efe2">

연차관리


### 4. 일정관리
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/20ec5b9b-7ff8-4f3c-bad8-55621e856fec">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/1aab9711-0e65-456b-bb43-56b3731366bb">


체크표시한 일정만 확인가능

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/b26fd30d-575c-4075-b0eb-87f5f245aa31">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/52392bcf-b8cc-41a3-a4ff-0c70d5e26126">

--
일정등록

### 5. 업무관리
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/3a4e96fc-da47-4142-8a2e-2a4740881528">

할 일 등록

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/b3e5409c-591e-4382-9b4d-d2b734c21a9c">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/6abb0f8c-dd09-4474-af4b-3a9d525e4828">

-메모

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/01066a39-a232-4a62-841c-f5084272a9b2">

'+' 버튼을 눌러 메모 생성, 내용 입력 후 '✓'버튼을 눌러야 저장가능

### 6. 사원관리
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/4d1000f0-208e-467f-84ba-e258228aba67">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/4112e90c-8965-4634-b0bd-b5084f89d96e">



### 7. 프로젝트
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/c060624e-da0e-487e-a0a8-ff904da86a58">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/3d9f0fcf-6427-449e-acb5-010c150d75f2">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/954bb636-831e-48bc-bfd6-bf941d390bd2">


### 8. 전자결재
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/3f40399b-d29b-4983-bb22-e3dce9d9a2bb">
<img width="436" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/b335ef17-1352-4fd3-8a6b-919300e045d7">


### 9. 게시판
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/9251f4fd-7c5e-4fae-a22e-54c1e49d3800">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/100bad81-8b94-4130-aba8-ada7c41e544c">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/0f89027e-df15-4033-9055-4846b06c7df3">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/9ae13a70-62c9-4836-9967-8b7ce529ded5">

### 관리자
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/bcc72a82-5f2c-40cd-980b-b7ab668b9893">

관리자

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/67cb0d30-96e5-46f3-b082-fefdfc7538df">

관리자 - 근태

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/d2e3dad2-9f8b-49d7-81dc-58ffc181be54">

관리자 - 연차

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/8cf721b1-8283-4260-a1a3-906e5f22bac8">

관리자 - 일정 : 전사일정만 등록가능

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/eed3b338-cc66-4759-810a-2c1f99066108">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/eb0f111b-2c98-458e-a581-37b987c3c6ae">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/76e1b5fe-df21-4086-b5dc-b921a3b15e7e">

관리자 - 사원관리

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/0828aec2-26ba-47dd-867e-4cf82de4c50e">

관리자 - 프로젝트 : 프로젝트 삭제 가능

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/226e8459-25b9-410f-9743-d6016c1dba3a">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/a6c8336f-183a-472f-a1ab-7b56f8d6461a">
<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/f8166d03-c97c-4693-b61a-753d986258b0">

<img width="960" alt="image" src="https://github.com/2211SpringCloudWebApp/TeamHub/assets/119032800/8d7668fa-270a-428b-9dc2-e7c03a126977">


관리자 - 게시판 : 관리자만 공지사항 등록 가능, 작성자 제한 가능


___
### ERD
![image](https://user-images.githubusercontent.com/119032800/236778623-504e1915-5d16-42e7-a3c0-f2db707f9366.png)
