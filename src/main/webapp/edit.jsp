<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.com.crud.dao.BoardDAO, org.example.com.crud.bean.BoardVO"%>

<%
    // 1. 수정할 글 번호 받기
    String id = request.getParameter("id");

    // 2. DB에서 해당 글 정보 가져오기
    BoardDAO boardDAO = new BoardDAO();
    BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .write-container { margin-top: 50px; max-width: 800px; }
    </style>
</head>
<body>

<div class="container write-container">
    <h3 class="text-center mb-4">📝 게시글 수정</h3>

    <form action="edit_ok.jsp" method="post">
        <input type="hidden" name="seq" value="<%=u.getSeq()%>">

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="<%=u.getTitle()%>" required>
        </div>

        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" value="<%=u.getWriter()%>" required>
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10"><%=u.getContent()%></textarea>
        </div>

        <div class="text-right">
            <a href="list.jsp" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-warning">수정 완료</button>
        </div>
    </form>
</div>

</body>
</html>