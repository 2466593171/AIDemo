<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Framework Main Page</title>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/picture.css">
    <style>
        /* 图片网格样式 */
        .image-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); /* 自动调整列数 */
            gap: 10px; /* 图片之间的间距 */
            margin-bottom: 20px; /* 图片区域与聊天框之间的间距 */
            overflow: hidden; /* 隐藏溢出的内容 */
        }

        .image-container {
            position: relative; /* 为了绝对定位下载按钮 */
            display: flex;
            flex-direction: column;
        }

        .image-grid img {
            width: 100%;
            height: auto; /* 高度自动调整 */
            object-fit: cover; /* 图片保持比例，填充容器 */
            border-radius: 8px; /* 圆角 */
            cursor: pointer; /* 鼠标悬停时显示手型 */
            opacity: 0.8; /* 图片透明度 */
            transition: opacity 0.3s; /* 透明度过渡效果 */
        }

        .image-grid img:hover {
            opacity: 1; /* 鼠标悬停时取消透明度 */
        }

        /* 下载按钮样式 */
        .download-button {
            display: inline-block;
            margin-top: 8px; /* 图片和按钮之间的间距 */
            padding: 8px 16px; /* 内边距 */
            background-color: #3498db; /* 按钮背景色 */
            color: #fff; /* 按钮文字颜色 */
            text-decoration: none; /* 去除下划线 */
            border-radius: 5px; /* 圆角 */
            font-size: 14px; /* 字体大小 */
            text-align: center; /* 文字居中 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 阴影效果 */
            transition: background-color 0.3s, transform 0.3s; /* 过渡效果 */
            opacity:0.8
        }

        .download-button:hover {
            background-color: #2980b9; /* 悬浮时背景色 */
            transform: scale(1.05); /* 悬浮时按钮放大 */
        }

        /* 模态框样式 */
        .modal {
            display: none; /* 隐藏模态框 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            align-items: center;
            justify-content: center;
            z-index: 1000; /* 确保模态框在最上层 */
        }

        .modal img {
            max-width: 90%;
            max-height: 80%;
            object-fit: contain; /* 确保图片完整显示 */
            border-radius: 8px; /* 圆角 */
        }

        .modal-close {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
            color: #fff;
            cursor: pointer;
        }
    </style>
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
            <span class="nav-icon">🚪</span>
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
                </select>
            </div>

            <!-- 聊天框 -->
            <div class="chat-container">
                <!-- 图片区域 -->
                <div class="image-grid" id="imageGrid">
                </div>

                <!-- 消息区域 -->
                <div class="chat-messages" id="chatContainer">
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

<!-- 模态框 -->
<div id="imageModal" class="modal">
    <span class="modal-close" onclick="closeModal()">×</span>
    <img id="modalImage" src="" alt="放大图片">
</div>

<script src="/js/index.js"></script>
<script src="/js/picture.js"></script>
<script>


    // // 示例数据更新
    // document.addEventListener('DOMContentLoaded', () => {
    //     // 示例图片数据
    //     const exampleImages = [
    //         'http://localhost:3000/proxy-image?url=https://files.kastg.xyz/tmp/th51/z05yvj6nkw.jpg',
    //         'http://localhost:3000/proxy-image?url=https://files.kastg.xyz/tmp/th51/3qzjetd3nki.jpg',
    //         'http://localhost:3000/proxy-image?url=https://files.kastg.xyz/tmp/th51/3qzjetd3nki.jpg',
    //         'http://localhost:3000/proxy-image?url=https://files.kastg.xyz/tmp/th51/z05yvj6nkw.jpg'
    //     ];
    //     updateImageGrid(exampleImages);
    // });
</script>

</body>
</html>
