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
                <i class="fas fa-balance-scale"></i>
                <span>법률상담 AI</span>
            </div>
            <div class="nav-menu">
                <a href="chat.do" class="nav-link"">
                    <i class="fas fa-comments"></i>
                    상담하기
                </a>
            </div>
        </div>
    </nav>

    <!-- 메인 콘텐츠 -->
    <main class="main-content">
        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-icon">
                <i class="fas fa-balance-scale"></i>
            </div>
            <h1>AI 법률상담 서비스</h1>
            <p>전문적인 AI 법률 상담을 통해 언제든지 법적 조언을 받아보세요. 24시간 언제나 이용 가능한 스마트한 법률 서비스입니다.</p>
            <a href="chat.do" class="cta-button">
                <i class="fas fa-comments"></i>
                상담 시작하기
            </a>
        </section>

        <!-- Features -->
        <section class="features">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3>전문적인 법률 지식</h3>
                <p>최신 법률 정보와 판례를 기반으로 한 정확한 법률 상담</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <h3>24시간 이용 가능</h3>
                <p>언제든지 필요할 때 즉시 법률 상담을 받을 수 있습니다</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>개인정보 보호</h3>
                <p>모든 상담 내용은 안전하게 보호되며 개인정보는 철저히 관리됩니다</p>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <h2>지금 바로 법률 상담을 시작해보세요</h2>
            <p>이 서비스는 일반적인 법률 정보 제공을 목적으로 하며, 구체적인 법적 조언을 위해서는 전문 변호사와 상담하시기 바랍니다.</p>
        </section>
    </main>
</body>
</html>