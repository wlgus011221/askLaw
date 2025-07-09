<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>askLaw</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/styles.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <!-- 네비게이션 -->
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand">
                <a href="main.do">
                    <i class="fas fa-balance-scale"></i>
                    <span>법률상담 AI</span>
                </a>
            </div>
        </div>
    </nav>
	 
    <!-- 채팅 컨테이너 -->
    <main class="chat-container">
        <!-- 채팅 영역 -->
        <section class="chat-section">
            <iframe
			 src="http://localhost/chatbot/1aDsvM3e5DqaCbZk"
			 style="width: 100%; height: 100%; min-height: 700px"
			 frameborder="0"
			 allow="microphone">
			</iframe>
        </section>
    </main>
</body>
</html>