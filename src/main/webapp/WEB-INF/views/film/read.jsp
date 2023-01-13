<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- <script src="/resources/jquery/jquery.min.js"></script>
 -->
 <%@include file="../includes/header.jsp"%>
 
 <div class="wrapper_read">
     <!-- read 헤드 -->
    <div class="read_head">
        <h3>Film Reaction 읽기</h3>
    </div>
    <div class="read_line"></div>
    <!-- read 테이블 -->
    <table class="read_table">
        <thead>
            <tr class="read_table_title">
                <th>제목</th>
                <td>${board.title}</td>
            </tr>
            <tr class="read_table_title">
                <th>작성자</th>
                <td>${board.writer}</td>
            </tr>
            <tr class="read_table_title">
                <th>작성일</th>
                <td>
					<c:choose>
                        <c:when test="${board.regdate } == ${board.updateDate }">
                            <fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.regdate}"/>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.updateDate}"/>
                        </c:otherwise>
                    </c:choose>
				</td>
            </tr>
        </thead>
    </table>
     <!-- 내용 출력 -->
    <div class="read_table_content">
        <textarea class="read_content" name="content" readonly="readonly">${board.content}</textarea>
    </div>
 
   <!-- modify ,list button & 댓글-->
    <div class="read_bottom">
        <button class="read_button" data-oper="list">목록</button>
        <sec:authentication property="principal" var="pinfo"/>
        <sec:authorize access="isAuthenticated()">
	        <c:if test="${pinfo.username eq board.writer}">
	        	<button class="read_button" data-oper='modify'>수정</button>
	        </c:if>
        </sec:authorize>
        <form id="operForm" action="/film/modify" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${criteria.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${criteria.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${criteria.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${criteria.keyword}"/>'>
		</form>      
	</div>
	
	<div class="read_reply">
         <sec:authorize access="isAuthenticated()">
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 작성</button>
		</sec:authorize>
    </div>
    
    <div>
    	<h4>댓글 목록</h4>
    </div>
    
     <!-- 댓글 보기 -->
     <div class="reply_list">
          <ul class="chat">
		  
          </ul>
          
          <div class="panel-footer">
			<!-- java script로 html 코드 동적 생성. -->
		 </div>
    </div>
    
    <sec:authorize access="isAuthenticated()">
	<div class=reply_form>
		<h4> 댓글 등록</h4>
		<div>		
			<label>작성자</label>	 	 	
			<input type="text" id="replyer" name="replyer" value="<sec:authentication property='principal.username'/>" readonly="readonly">
		</div>
		<div>
			<label>댓글</label>
			<input type="text" id="reply" name="reply">
		</div>
		<input type="hidden" id="bnoReply" name="bno" value="${board.bno}">
		<div>
			<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
			<button id='modalCloseBtn' type="button" class="btn btn-default">종료</button>
		</div>
	</div>
	</sec:authorize>
    
</div>

<script src="/resources/js/read.js"></script>
<script>
$(document).ready(function() {
	 var csrfHeaderName = "${_csrf.headerName}";
 	 var csrfTokenValue = "${_csrf.token}";
 	 console.log(csrfHeaderName , csrfTokenValue );
 	 $(document).ajaxSend(function(e, xhr, options) {
 		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
 	 });
 	 
 	var replyUL = $(".chat");
 	var bnoValue = $("#bnoReply").val();
 	
 	showList(1);
 	function showList(page) {
 		
 		replyService.getList(
 			{bno:bnoValue, page: page || 1},
 			function(replyCnt, list) {
 				console.log("replyCnt: "+replyCnt);
 				console.log("list: " + list)
 				console.log(list);
 				
 				if(page==-1){
 					pageNum = Math.ceil(replyCnt/10.0);
 					showList(pageNum);
 					return;
 				}
 				
 				var str="";
 				
 				if(list == null || list.length == 0) {
 					replyUL.html("");
 					return;
 				}
 				
 				for(var i =0, len = list.length || 0; i<len; i++){
 					str += "<li data-rno='"+list[i].rno+"'>";
 					str += "<p>"+list[i].replyer+" |  "+replyService.displayTime(list[i].replyDate)+"</p>";
 					str += "<p>"+list[i].reply+"</p></li>";
 				}
 				
 				replyUL.html(str);
 				showReplyPage(replyCnt);
 			});
 		}
 	
 	
	 	var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt) {
			var endNum = Math.ceil(pageNum/10.0) *10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			var str="<ul class='pagination previous'>";
			if(prev) {
				str+= "<li class='paginate_button'><a href='"+(startNum-1)+"'>Prev</a></li>";
			}
			for(var i =startNum ; i <= endNum; i++) {
				var active = pageNum == i? "active":"";
				str+= "<li class='paginate_button "+active+" '><a href='"+i+"'>"+i+"</a></li>";
			}
			if(next) {
				str+= "<li class='paginate_button next'><a href='"+(endNum+1)+"'>Next</a></li>";
			}
			str+="</ul></div>";
			console.log(str);
			replyPageFooter.html(str);
		} <!--end showReplyPage -->
		
		replyPageFooter.on("click", "li a",
			function(e) {
				e.preventDefault();
				console.log("page Click");
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: " + targetPageNum);
				pageNum = targetPageNum;
				showList(pageNum);
		});
});
</script>

<%@include file="../includes/footer.jsp" %>
