# FilmReaction
> 영화 리뷰 게시판 사이트</br></br>
개발 기간: 2023.01.04 - 2023.01.16
<br/><br/>


### 1. 프로젝트 구성 소개
* <b>메인 화면</b> </br>
 메인 화면은 영화 사이트의 API로 정보를 받아와 구성하였다. 글쓰기, 게시판, 로그인 , 회원가입 메뉴가 있다.</br>
상단의 Film Reaction을 누르면 메인 화면으로 돌아온다.
</br></br>
* <b>글쓰기</b> </br>
 로그인을 해야 들어올 수 있게 만들어놨다. 비로그인시 로그인 화면으로 보내지며, 로그인한 회원들이 글을 쓸 수 있게 만들었다.
</br></br>
* <b>게시판</b> </br>
 서치 기능, 페이징 기능을 구현하였고, 게시판의 종류를 두개로 만들어 하나는 텍스트로, 다른 하나는이미지 게시판으로 구성하였다. 게시글을로 들어가면, 글을 볼 수있고, 로그인한 유저는 댓글을 달 수 있다.또, 게시글의 작성자는 글을 수정하고 삭제할 권한을 가지고 있다.
</br></br>
* <b>로그인,로그아웃,회원가입</b> </br>
 Spring security를 적용하였으며, 로그인 기능을 구현하였고, 자동 로그인 기능을 구현하여 다음 사이트에 접속할때
로그인이 되어 있도록 했다.(일정 시간이 지나면 로그인이 풀린다.) 로그인이 될 시, 메뉴에서 로그인이 사라지고 로그아웃
메뉴가 나타나게 되어있고 로그아웃은 버튼을 누를시 작동한다.
회원가입 기능은 간단한 검증을 Js를 통하여 이루어지도록 해놓았다.
</br></br>
* <b>댓글</b><br>
 Rest API방식을 이용하여 댓글의 등록, 삭제, 수정, 읽기를 구현하였으며 이를 Ajax 기술을 통하여 화면에 댓글이 나타나게 하였다.

### 2. 프로젝트의 목적

* <b>배운 기술을 활용해 보자</b>
공부를 하면서 배운 Spring Mvc 기술들을 활용하여 웹 사이트를 만들려고 하는데 무엇을 만들면 좋을지 생각 해 보다 기본적인 CRUD 기능을 보여줄 수 있는 형식을 만들어야 겠다 생각하였고 이를 위해 게시판 형식을 가져와 영화 리뷰 사이트를 구성한다는 식으로 만들어 보았다. 학습하였던 기술들을 사용하려는 목적을 가지고 학습한 방법을 사용해 보았다. Rest API방식과 ajax를 이용한 서버와 프론트간의 데이터 통신, Mybatis를 적용하여 쿼리문과 동적 쿼리등의 생성을 하였으며, MVC 패턴을 적용하여 Controller, Service, Repository를 분리하였다. 또한 객체지향적인 설계를 위해 고민을 했습니다. 이를 위해 추상화와 다형성등을 적극 활용하였습니다.
 
### 3. 사용 기술
>_Java11_,  _Spring_,  _Maven_,  _MySQL_,  _Mybatis_,  _Spring Security_,  _Lombok_, _HTML_, _CSS_, _Javascript_, _JQuery_ 


### 4.ERD
![poster](./erd.jpg)<br/>
