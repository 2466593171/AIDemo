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
            <!-- 头像框和下拉列表 -->
            <div class="profile-container">
                <img id="profilePicture" class="profile-picture" src="/images/img_1.png" alt="头像">
                <select id="profileSelect" onchange="changeProfile()">
                    <!-- 下拉列表的选项将从后端数据填充 -->
                </select>
            </div>

            <!-- 聊天框 -->
            <div class="chat-container">
                <!-- 消息区域 -->
                <div class="chat-messages" id="chatContainer">
                    <div class="chat-message user">
                        <div class="chat-bubble">这是用户的消息。</div>
                        <img src="/images/img.png" alt="用户头像">
                    </div>
                    <div class="chat-message robot">
                        <img id="serverAvatar" src="/images/img_1.png" alt="服务器头像">
                        <div class="chat-bubble">这是从后端返回的消息。</div>
                    </div>
                </div>

                <!-- 输入框和发送按钮 -->
                <div class="chat-input-container">
                    <input type="text" id="chatInput" class="chat-input" placeholder="输入消息...">
                    <button class="chat-send-button" onclick="sendMessage()">发送</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/index.js"></script> <!-- 引入 JavaScript 文件 -->
<script src="/js/chat.js"></script> <!-- 引入 JavaScript 文件 -->


</body>

</html>
