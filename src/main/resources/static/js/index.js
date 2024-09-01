// index.js

function toggleSidebar() {
    const sidebar = document.querySelector('.sidebar');
    sidebar.classList.toggle('collapsed');
}

function navigateTo(url) {
    window.location.href = url;
}

function showToast(message) {
    // 这里可以实现你自己的 toast 通知逻辑
    alert(message);
}

function logout() {
    const token = window.localStorage.getItem("token");
    window.localStorage.removeItem("token");
    fetch('/user/loginOut', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        }
    })
        .then(response => {
            return response.json()
        })
        .then(data => {
            console.log(data);
            if (data.status === 200) {
                // 登出成功
                window.localStorage.removeItem("token");
                showToast('登出成功');
                window.location.href = '/user/login'; // 跳转到登录页面
            } else {
                showToast('登出失败');
            }
        })
        .catch((error) => {
            showToast('网络错误');
        });
}
