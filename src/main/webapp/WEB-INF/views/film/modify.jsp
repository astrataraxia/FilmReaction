<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="wrapper_read">
		<div class="read_head">
			<h3>Film Reaction 수정</h3>
		</div>
		 <div class="read_line"></div>
		
			<form role="form" action="/film/modify" method="post">
			    <table class="read_table">
				        <thead>
					         <tr class="read_table_title">
					         	<th>번호</th>
					            <td><input class="form-control" name="bno" 
					            value='<c:out value="${board.bno}"/>' readonly="readonly"></td>
					          </tr>
				            <tr class="read_table_title">
				                <th>제목</th>
				                <td> <input class="form-control" name="title" 
								value='<c:out value="${board.title}"/>'></td>
				            </tr>
				            <tr class="read_table_title">
				                <th>작성자</th>
				                <td><input class="form-control" name="writer"
								value='<c:out value="${board.writer}"/>' readonly="readonly"></td>
				            </tr>
				            <tr class="read_table_title">
				                <th>작성일</th>
				                <td><input class="form-control" name="regDate"
								value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>' readonly="readonly"></td>
				            </tr>
				        </thead>
				  </table>
			    
			    <!-- 내용 출력 -->
			    <div class="read_table_content">
			        <textarea class="read_content" name="content"><c:out value="${board.content}"/></textarea>
			    </div>
					
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq board.writer}">
							<button type="submit" data-oper='Modify' class="read_button" >수정</button>
							<button type="submit" data-oper='remove' class="read_button" >삭제</button>
						</c:if>
					</sec:authorize>
					
					<button type="submit" data-oper="list" class="read_button">List</button>
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="pageNum" value='<c:out value="${criteria.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${criteria.amount}"/>'>
					<input type='hidden' name='type' value='<c:out value="${criteria.type}"/>'>
				    <input type='hidden' name='keyword' value='<c:out value="${criteria.keyword}"/>'>
					
				</form>
				
</div> <!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'remove') {
				formObj.attr("action", "/film/remove");
			} else if(operation ==='list') {
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
			formObj.submit();
		});
	});

</script>



<%@include file="../includes/footer.jsp" %>
