<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>새 글 작성</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .write-container { margin-top: 50px; max-width: 800px; }
    </style>
</head>
<body>

<div class="container write-container">
    <h3 class="text-center mb-4"> 새 글 작성</h3>

    <form action="write_ok.jsp" method="post">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>

        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" required>
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10"></textarea>
        </div>

        <div class="text-right">
            <a href="list.jsp" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">저장</button>
        </div>
    </form>
</div>

</body>
</html>