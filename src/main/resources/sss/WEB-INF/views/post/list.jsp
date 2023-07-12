<%@	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE	html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,	initial-scale=1">
<title>글목록</title>
<!--	Latest	compiled	and	minified	CSS	-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!--	Custom	CSS	-->
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<%@	include file="../layout/header.jsp"%>
	<div id="mainWrap" class="wrap	container">
		<h1>글목록 페이지</h1>
		<hr>
		<div id="listArea">
			<div class="listColumn	listHeader	dFlex">
				<span class="num">번호</span> <span class="title">제목</span> <span
					class="userid">작성자</span> <span class="readcnt">조회수</span> <span
					class="regTM">등록시간</span>
			</div>
			
			<c:if test="${!empty postList}">
				<c:forEach var="post" items="${postList.content}">
					<div class="listColumn	listRow	dFlex">
						<span class="num">${post.num}</span> <span class="title">${post.title}</span>
						<span class="userid">${post.userid}</span> <span class="readcnt">${post.readcnt}</span>
						<span class="regTM">${post.regTM}</span>
					</div>
					<!--	div.listAres	-->
				</c:forEach>
			</c:if>
			<!--	페이지네이션	시작	-->
			<ul class="pagination	justify-content-center">
				<!--	이전페이지(Previous	page)	-->
				<c:choose>
					<c:when test="${postList.first}">
						<li class="page-item	disabled"><a class="page-link"
							href="?page=${postList.number-1}">Prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?page=0">Prev</a></li>
					</c:otherwise>
				</c:choose>
				<!--	페이지	번호	-->
				<c:forEach var="i" begin="1" end="${postList.totalPages}">
					<li class="page-item"><a class="page-link" href="?page=${i-1}">${i}</a></li>
				</c:forEach>
				<!--	다음페이지(Next	page)	-->
				<c:choose>
					<c:when test="${postList.last}">
						<li class="page-item	disabled"><a class="page-link"
							href="?page=${postList.number+1}">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?page=${postList.totalPages-1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<!--	페이지네이션	끝	ul.pagination	-->
		</div>
		<!--	div#listArea	-->
	</div>
	<!--	div#mainWrap.container	-->
	<%@	include file="../layout/footer.jsp"%>
	<!--	<script	src="/script/jquery-3.6.4.min.js"></script>	-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>