<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" href="/css/style.css">

    <script>
        function handleRegister(event) {
            event.preventDefault();
            const form = document.getElementById('registerForm');

            const formData = new FormData(form);

            // 将 FormData 转换为 JSON 对象
            const formObject = {};
            formData.forEach((value, key) => {
                formObject[key] = value;
            });

            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            // 检查密码和确认密码是否匹配
            if (password !== confirmPassword) {
                alert('密码和确认密码不匹配！');
                return;
            }
            // 使用 fetch 发送请求到后端
            fetch('/user/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formObject), // 将对象转换为 JSON 字符串
            })
                .then(response =>{
                    if (response.ok) {
                        return response.json(); // 解析 JSON 响应
                    } else {
                        throw new Error('网络响应不正常');
                    }})
                .then(data => {
                        if (data.status === 200) {
                            alert(data.message);
                            // 注册成功后可以跳转到登录页面或其他页面
                            window.location.href = '/user/login';
                        } else if (data.status === 400) {
                            alert(data.message);
                        } else {
                            alert('发生了其他错误');
                        }
                })
                .catch(error => {
                    console.error('Error:', error.message);
                    alert(error.message);
                });
        }
    </script>
</head>
<body>
<div class="video-background">
    <video autoplay loop muted>
        <source src="/videos/background.mp4" type="video/mp4">
    </video>
</div>
<div class="form-container">
    <h1>注册</h1>
    <form id="registerForm" action="/user/register" method="post">
        <div class="input-group">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-group">
            <label for="confirmPassword">确认密码:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit" onclick="handleRegister(event)">注册</button>
    </form>
    <p>已有账号？ <a href="/user/login">登录</a></p>
</div>
</body>
</html>
