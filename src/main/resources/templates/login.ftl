<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="/css/style.css">

    <div id="toast" class="toast">登录成功!</div>

    <script>
        function handleLogin(event) {
            event.preventDefault(); // 阻止表单默认提交

            const form = document.getElementById('loginForm');
            const formData = new FormData(form);

            // 将 FormData 转换为 JSON 对象
            const formObject = {};
            formData.forEach((value, key) => {
                formObject[key] = value;
            });
            // 发送请求到服务器
            fetch('/user/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formObject),
            }).then(response => {
                return response.json()
            })
                .then(data => {
                 console.log(data)
                    if (data.status === 200) {
                        showToast('登录成功');
                        window.localStorage.setItem("token", data.message);
                        // 注册成功后可以跳转到登录页面或其他页面
                        // 跳转到其他页面，例如首页
                        window.location.href = '/home/index'
                    } else if (data.status === 400) {
                        alert(data.message);
                    } else {
                        alert('发生了其他错误');
                    }
                }).catch((error) => {
                alert("登录失败")
            });
        }

        function showToast(message) {
            const toast = document.getElementById('toast');
            toast.textContent = message; // 设置提示框内容
            toast.className = 'toast show'; // 显示提示框

            // 设置定时器在一定时间后隐藏提示框
            setTimeout(() => {
                toast.className = 'toast'; // 隐藏提示框
            }, 2500); // 提示框显示时间
        }
    </script>
    <style>
        /* 提示框样式 */
        .toast {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #333;
            color: #FAEBD7;
            text-align: center;
            border-radius: 2px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
        }

        .toast.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }
    </style>
</head>
<body>
<div class="video-background">
    <video autoplay loop muted>
        <source src="/videos/background.mp4" type="video/mp4">
    </video>
</div>
<div class="form-container">
    <h1>登录</h1>
    <form id="loginForm" action="/user/login" method="post">
        <div class="input-group">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <!-- 登录按钮添加点击事件 -->
        <button type="submit" class="login-button" onclick="handleLogin(event)">登录</button>
    </form>
    <p>没有账号? <a href="/user/register">注册</a></p>
</div>
</body>
</html>
