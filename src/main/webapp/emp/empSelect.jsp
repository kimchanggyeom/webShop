<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.shinhan.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <jsp:include page="../common/commonfile.jsp"></jsp:include> ../에 ${path} 사용불가능! --%>
<%@ include file="../common/commonfiles.jsp"%>
<script>
	$(function() {
		$(".btnDel").on(
				"click",
				function() {
					location.href = "${path}/emp/empDelete.do?empid="
							+ $(this).attr("data-del");
				})
	});
	$(function() {
		$("#btn1").click(function() {
			//$("td:odd").css("backgroundColor", "lightgreen");
			//body > div > table > tbody > tr:nth-child(1) > td:nth-child(2) --> Steven
			//body > div > table > tbody > tr:nth-child(2) > td:nth-child(2) --> Neena
			$("tr:nth-child(2n)").css("backgroundColor", "lightgray");
			$("tr:nth-child(2n+1)").css("backgroundColor", "white");
		})
		$("#btn2").click(function() {
			$("tr> td:nth-child(2):contains('S')").css("color", "red");
		})
		$("#btn3").click(function() {
			$("tr td:contains('S')").css("color", "blue");
		})
		$("#btn4").on("click", function() {
			init();
			var selector = " tr > td:nth-child(5)";
			$(selector).each(function(index, item) {
				var sal = parseInt($(item).html());
				if (sal >= 5000) {
					$(item).css("background-color", "lightgreen")
				}
			})
		})
		$("thead tr th").click(function(e) {
			var trNum = $(this).closest("th").prevAll().length;
			//$(this).find(" ~ th").css("background-color", "white");
			//$(this).css("background-color", "orange");
			var a = $("tbody tr").each(function(index, item) {
				var col = $(item).find("td:nth-child(" + (trNum + 1) + ")");
				console.log(col);
				$(item).find("td").css("background-color", "white");
				$(col).css("background-color", "orange");
			});
		});
		var str = "";
		var arr = [ "IT_PROG", "AD_VP", "AD_PRES", "ST_MAN", "ST_CLERK" ];
		$.each(arr, function(index, item) {
			str += "<option>" + item + "</option>";
		});
		$("#jobs").html(str); //html() : jquery 함수, innerHTML은 자바스크립트 속성
		$("select").change(function() {
			var jobid = $(this).val();
			//init();
			$("tr td").css("color", "black");
			$("tr td:contains('" + jobid + "')").css("color", "red");
		});
	})
</script>
</head>
<body>
	<div class="container mt-3">
		<h1 class="grad">직원목록</h1>
		<!-- include 지시자 : 디렉티브는 소스를 합쳐서 컴파일한다. -->
		<%-- <%@ include file="../common/Header.jsp" %> --%>
		<!-- include했을 때, header.jsp에서 선언한 변수를 다른 파일에서 사용할 수 있다. -->
		<%-- <h2><%=company %></h2> --%>
		<!--include action tag 이용 : 컴파일 하고 합침 -->
		<%-- <h2><%=company %></h2> 컴파일 하고 합치기 때문에 company 사용불가! --%>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<button onclick="location.href='empinsert.do'" type="button" class="btn btn-success">직원등록</button>
		<form method="post" action="result.jsp">
			<input type=hidden name="param1" value="zz.png" /> <br> <input type=hidden name="param2" value="ss.png" /> <br> <input type="submit" value="이미지 다운로드">
		</form>

		<button onclick="location.href='${path}/emp/empinsert.do'" type="button" class="btn btn-success">직원등록</button>

		<a type="button" class="btn btn-success" href="empinsert.do">직원등록</a>

		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">modal이용 직원등록</button>

		<%@ include file="empInsertModal.jsp"%>

		<hr>
		<button id='btn1'>짝수행만 선택</button>
		<button id='btn2'>이름이 S로 시작하는 직원</button>
		<button id='btn3'>S가 포함된 것</button>
		<button id='btn4'>연봉 5000 이상인 직원</button>
		<select id="jobs">
		</select>
		<hr>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>순서</th>
					<th>직원번호</th>
					<th>이름</th>
					<th>성</th>
					<th>이메일</th>
					<th>급여</th>
					<th>누적급여</th>
					<th>입사일</th>
					<th>전화번호</th>
					<th>직책</th>
					<th>매니져</th>
					<th>커미션</th>
					<th>부서</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<!--for(EmpVO emp : empAll) 문장과 같다 -->
				<c:set var="totalSalary" value="0" />
				<c:forEach items="${empAll}" var="emp" varStatus="status">
					<c:set var="totalSalary" value="${totalSalary + emp.salary}" />
					<tr>
						<td style="background-color:${status.first||status.last?'orange':'white'}">${status.count}</td>
						<td><a href="empDetail.do?empid=${emp.employee_id}">${emp.employee_id}</a></td>
						<td><a style="color: ${fn:length(emp.first_name)>3?'red':'blue'};" href="empDetail.do?empid=${emp.employee_id}">${emp.first_name}</a></td>
						<td>${emp.last_name}</td>
						<td>${emp.email}${fn:substring(emp.email, 0, 3)}** ${fn:indexOf(emp.email,"@")}** ${fn:indexOf(emp.email,"@")>=0?fn:substring(emp.email,0,3):emp.email}</td>
						<td><fmt:formatNumber value="${emp.salary}" groupingUsed="true" /></td>
						<td>${totalSalary}</td>
						<td><fmt:formatDate value="${emp.hire_date}" pattern="yyyy/MM/dd" /></td>
						<td>${emp.phone_number}</td>
						<td>${emp.job_id}</td>
						<td>${emp.manager_id}</td>
						<td>${emp.commission_pct}---<fmt:formatNumber value="${emp.commission_pct}" type="percent" />
						</td>
						<td>${emp.department_id}</td>
						<td><button class="btnDel" data-del="${emp.employee_id}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>