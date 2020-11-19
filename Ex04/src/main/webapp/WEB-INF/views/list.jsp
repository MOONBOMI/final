<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소목록</title>
<style>
	a {color : blue; text-decoration:none;}
	.active {color :red }
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>[주소목록]</h1>
	<div id="divSearch">
		<form action="list" name="frm">
			<select name="searchType">
				<option value="name" <c:out value="${pm.cri.searchType=='name'?'selected':'' }"/>>이름</option>
				<option value="addr" <c:out value="${pm.cri.searchType=='addr'?'selected':'' }"/>>주소</option>
				<option value="tel" <c:out value="${pm.cri.searchType=='tel'?'selected':'' }"/>>전화</option>
			</select>
			<input type="text" name="keyword" value="${pm.cri.keyword }">
			<select name="perPageNum">
				<option value="5" <c:out value="${pm.cri.perPageNum=='5'?'selected':'' }"/>>5줄씩 출력</option>
				<option value="10" <c:out value="${pm.cri.perPageNum=='10'?'selected':'' }"/>>10줄씩 출력</option>
				<option value="20" <c:out value="${pm.cri.perPageNum=='20'?'selected':'' }"/>>20줄씩 출력</option>
			</select>
			<input type="submit" value="검색">
			<input type="hidden" name="page" value=1>
		</form>
		검색수 : ${pm.totalCount}
	</div>
	<table border=1>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td width=50>${vo.ano }</td>
				<td width=100>${vo.name }</td>
				<td width=200>${vo.addr }</td>
				<td width=200>${vo.tel }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="pagination">
      <c:if test="${pm.prev}">
         <a href="${pm.startPage-1}">◀</a>
      </c:if>
      <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
         <c:if test="${pm.cri.page==i}">
            [<a href="${i}" class="active">${i}</a>]
         </c:if>   
         <c:if test="${pm.cri.page!=i}">
            [<a href="${i}">${i}</a>]
         </c:if>
      </c:forEach>
      <c:if test="${pm.next}">
         <a href="${pm.endPage+1}">▶</a>
      </c:if>
   </div>
</body>
<script>
	$("#pagination a").on("click",function(e){
		e.preventDefault();
		$(frm.page).val($(this).attr("href"));
		frm.submit();
	});
	
	$(frm.perPageNum).on("change",function(){
		frm.submit();
	});
</script>
</html>