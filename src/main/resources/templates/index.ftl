<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Framework Main Page</title>
    <link rel="stylesheet" href="/css/index.css"> <!-- 引入 CSS 样式文件 -->
    <link rel="stylesheet" href="/css/chat.css"> <!-- 引入 CSS 样式文件 -->
</head>
<body>

<div class="wrapper">
    <!-- 左侧导航栏 -->
    <div class="sidebar">
        <button class="toggle-button" onclick="toggleSidebar()">☰</button>
        <ul class="nav-list">
            <li onclick="navigateTo('/home/index')">
                <span class="nav-icon collapsed-icon">🏠</span>
                <span class="nav-text">主页</span>
            </li>
            <li onclick="navigateTo('/home/chat')">
                <span class="nav-icon collapsed-icon">📄</span>
                <span class="nav-text">聊天</span>
            </li>
            <li onclick="navigateTo('/home/picture')">
                <span class="nav-icon collapsed-icon">📊</span>
                <span class="nav-text">画图</span>
            </li>
        </ul>
        <!-- 添加登出按钮 -->
        <button class="logout-button toggle-button" onclick="logout()">
            <span class="nav-icon">🚪</span> <!-- 登出图标 -->
        </button>
    </div>

    <!-- 主要内容区 -->
    <div class="main-content">
        <!-- 视频背景 -->
        <div class="video-background">
            <video autoplay loop muted>
                <source src="/videos/background.mp4" type="video/mp4">
                您的浏览器不支持 HTML5 视频标签。
            </video>
        </div>

        <!-- 内容层 -->
        <div class="content-overlay">
            <h1>欢迎来到主页</h1>
            <p>请选择左侧的项目导航进行访问。</p>
        </div>
    </div>
</div>

<script src="/js/index.js"></script> <!-- 引入 JavaScript 文件 -->
</body>
</html>
