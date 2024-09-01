document.addEventListener("DOMContentLoaded", function () {
    var token = window.localStorage.getItem("token");
    // 调用后端接口获取数据
    fetch('/chatconfig/list', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        }
    })
        .then(response => response.json()) // 解析返回的 JSON 数据
        .then(data => {
            console.log(data)
            // 假设后端返回的数据格式为：[{ name: "Alice", picture: "/images/img_1.png" }, ...]
            const select = document.getElementById('profileSelect');

            const profiles = JSON.parse(data.message);
            // 清空当前选项
            select.innerHTML = '';

            // 遍历后端返回的数据并填充下拉列表
            profiles.forEach(profile => {
                const option = document.createElement('option');
                option.value = profile.pictureAddr;  // 使用 pictureAddr 作为选项的值
                option.text = profile.platform;      // 使用 platform 作为选项的文本
                select.add(option);
            });

            select.addEventListener('change', function () {
                // 获取当前选中的值
                const selectedValue = select.value; // 获取选中的 option 的 value
                console.log("选中的值:", selectedValue);

                // 如果需要获取选中的选项的文本
                const selectedText = select.options[select.selectedIndex].text;
                console.log("选中的文本:", selectedText);
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });


});


function changeProfile() {
    const selectedPicture = document.getElementById('profileSelect').value;
    document.getElementById('profilePicture').src = selectedPicture;

    // 更新聊天框中后端返回的头像
    document.getElementById('serverAvatar').src = selectedPicture;
}

function sendMessage() {
    //获取平台信息
    const select = document.getElementById('profileSelect');

    console.log(select.options[select.selectedIndex].text)

    const Chathistory = {};

    const input = document.getElementById('chatInput');
    const message = input.value.trim();

    Chathistory.platform = select.options[select.selectedIndex].text;
    Chathistory.content=message;

    if (message === '') return; // 如果输入为空则不发送

    const chatContainer = document.getElementById('chatContainer');

    // 创建用户消息元素

    const userMessage = document.createElement('div');
    userMessage.classList.add('chat-message', 'user');
    userMessage.innerHTML = `<div class="chat-bubble">${message}</div><img src="/images/img.png" alt="用户头像">`;

    // 添加消息到聊天框
    chatContainer.appendChild(userMessage);
    input.value = ''; // 清空输入框
    chatContainer.scrollTop = chatContainer.scrollHeight; // 滚动到最新消息
    var token = window.localStorage.getItem("token");
    //发送请求到后端
    fetch('/chathistory/sendMessage', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        },
        body: JSON.stringify(Chathistory),
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);
            // 创建服务器消息元素
            const serverMessage = document.createElement('div');
            serverMessage.classList.add('chat-message', 'server');
            serverMessage.innerHTML = `<img src="/images/img_1.png" alt="服务器头像"><div class="chat-bubble">${data.message}</div>`;

            // 添加消息到聊天框
            chatContainer.appendChild(serverMessage);
            chatContainer.scrollTop = chatContainer.scrollHeight; // 滚动到最新消息
        })
        .catch(error => {
            console.error('Fetch error:', error);
        });
}

