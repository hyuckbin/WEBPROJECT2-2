<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.com.crud.dao.BoardDAO, org.example.com.crud.bean.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP 게시판 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .table-container { margin-top: 50px; }
        .page-title { margin-bottom: 30px; text-align: center; }
    </style>
</head>
<body>

<%
    // 3. DAO를 통해 DB에서 리스트 가져오기
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list", list);
%>

<div class="container table-container">
    <h2 class="page-title">📋 자유 게시판</h2>

    <div class="text-right mb-3">
        <a href="write.jsp" class="btn btn-primary">새 글 작성</a>
    </div>

    <table class="table table-hover table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.seq}</td>
                <td><a href="view.jsp?id=${u.seq}">${u.title}</a></td> <td>${u.writer}</td>
                <td>${u.regdate}</td>
                <td>${u.cnt}</td>
                <td>
                    <a href="edit.jsp?id=${u.seq}" class="btn btn-warning btn-sm">수정</a>
                    <a href="javascript:delete_ok('${u.seq}')" class="btn btn-danger btn-sm">삭제</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function delete_ok(id) {
        if(confirm("정말로 이 글을 삭제하시겠습니까?")) {
            location.href = "delete_ok.jsp?id=" + id;
        }
    }
</script>

</body>
</html>