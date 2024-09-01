document.addEventListener("DOMContentLoaded", function () {
    var token = window.localStorage.getItem("token");
    // 调用后端接口获取数据
    fetch('/pictureconfig/list', {
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
                option.value = profile.picture;  // 使用 pictureAddr 作为选项的值
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

// 显示模态框
function openModal(src) {
    document.getElementById('modalImage').src = src;
    document.getElementById('imageModal').style.display = 'flex';
}

// 关闭模态框
function closeModal() {
    document.getElementById('imageModal').style.display = 'none';
}

// 更新图片网格
// 显示模态框
function openModal(src) {
    document.getElementById('modalImage').src = src;
    document.getElementById('imageModal').style.display = 'flex';
}

// // 关闭模态框
// function closeModal() {
//     document.getElementById('imageModal').style.display = 'none';
// }

// 更新图片网格
function updateImageGrid(images) {
    const imageGrid = document.getElementById('imageGrid');
    imageGrid.innerHTML = ''; // 清空当前内容
    images.forEach(url => {
        url="http://localhost:3000/proxy-image?url="+url;
        const container = document.createElement('div');
        container.classList.add('image-container');

        const img = document.createElement('img');
        img.src = url;
        img.onclick = () => openModal(url);

        const downloadButton = document.createElement('a');
        downloadButton.href = url;
        downloadButton.download = ''; // 提供默认下载文件名
        downloadButton.classList.add('download-button');
        downloadButton.innerHTML = '下载';

        container.appendChild(img);
        container.appendChild(downloadButton);
        imageGrid.appendChild(container);
    });
}


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

    const Picture = {};

    const input = document.getElementById('chatInput');
    const message = input.value.trim();

    Picture.platform = select.options[select.selectedIndex].text;
    Picture.describe=message;

    if (message === '') return; // 如果输入为空则不发送

    var token = window.localStorage.getItem("token");
    //发送请求到后端
    fetch('/picture/sendMessage', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        },
        body: JSON.stringify(Picture),
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            const s = JSON.parse(data.message);

            var exampleImages = JSON.parse(s);

            updateImageGrid(exampleImages);

        })
        .catch(error => {
            console.error('Fetch error:', error);
        });
}

