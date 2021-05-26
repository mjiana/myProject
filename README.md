# myProject

수업 진도에 따라 업데이트 중
수업기간 : 2021.04.13 ~ 2021.09.14(870시간)
  * 04.13 ~ 05.04 java
  * 05.06 ~ 05.10 html, js
  * 05.11 ~ 05.20 jsp, 회원가입
  * 05.21 ~ 26 일반형 게시판, 답글형 게시판  

다른 repositories는 백업 개념으로 파일 업로드 중이고,  
myProject는 수업내용을 기반으로 혼자서 만들어보는 공간이다.  

2021.05.19 - 2021.05.25: 회원가입 폼(), 정보 확인 페이지
  * 05.20 AM 1:53 : 단일 페이지일때는 괜찮았지만 메인페이지에 jsp:include하면서 중복 폼 문제로 거주지 구 부분 미작동
  * 05.25 AM 2:34 : SignUp.jsp의 jsp:include부분을 iframe으로 바꿔서 해결
  * 회원가입, 로그인, 내 정보보기, 로그아웃
  * 회원가입 시 ID 중복확인 기능, 거주지 전국 시도군/구 선택  
  
2021.05.26 : 일반형 게시판(답글, 댓글 기능 없음)  
   * 글쓰기, 글목록, 글보기, 글수정, 글삭제 가능
   * 글목록 검색, 페이징 기능,  글 수정/삭제 전 비밀번호 체크
