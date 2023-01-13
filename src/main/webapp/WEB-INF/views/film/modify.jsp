<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="wrapper_read">
    <!-- read 헤드 -->
    <div class="read_head">
        <h3>Film Reaction 수정</h3>
    </div>
    <div class="read_line"></div>
    <!-- read 테이블 -->
    <form role="form" action="/film/board/modify" method="post">
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
	                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
	            </tr>
	        </thead>
	    </table>
	    
	    <!-- 내용 출력 -->
	    <div class="read_table_content">
	        <textarea class="read_content" name="content">${board.content}</textarea>
	    </div>
		
	    <!-- modify ,list button & 댓글-->
	    <div class="read_bottom">
	    	<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq board.writer}">
			        <button type="submit" class="read_button" data-oper='Modify' >수정</button>
			        <button type="submit" class="read_button" data-oper='remove' >삭제</button>
			     </c:if>
			 </sec:authorize>
	        <button class="read_button"  type="submit" data-oper="list_m">목록</button>
	    </div>
	    
  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="pageNum" value='<c:out value="${criteria.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${criteria.amount}"/>'>
		<input type='hidden' name='type' value='<c:out value="${criteria.type}"/>'>
	    <input type='hidden' name='keyword' value='<c:out value="${criteria.keyword}"/>'>
	    <input type='hidden' name="bno" id="bno" value="${board.bno}"/>
	    <input type="hidden" name="title" id="title" value="${board.title}"/>
	 </form>
	 

</div>



<script>
$(document).ready(function() {
	var formObj = $("form");
	$('button').on("click", function(e) {
		e.preventDefault();
		var bno = $("#bno").val();
		var title = $("#title").val();
		console.log(bno);
		var operation = $(this).data("oper");
		
		if(operation === 'remove') {
			formObj.attr("action", "/film/remove");
			formObj.append(bno);
		} else if(operation ==='list_m') {
			//move to list
			formObj.attr("action", "/film/board").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag =$("input[name='keyword']").clone();
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);				
		}
		formObj.append(title)
		formObj.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp" %>
