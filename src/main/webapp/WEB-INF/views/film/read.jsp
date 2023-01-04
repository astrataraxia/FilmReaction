<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
					<td>title</td>
				</tr>
				<tr class="read_table_title">
					<th>작성자</th>
					<td>user</td>
				</tr>
				<tr class="read_table_title">
					<th>작성일</th>
					<td>2023-01-01</td>
				</tr>
			</thead>
		</table>

		<!-- 내용 출력 -->
		<div class="read_table_content">
			<textarea class="read_content" name="content" readonly="readonly"></textarea>
		</div>
	</div>

<%@include file="../includes/footer.jsp" %>