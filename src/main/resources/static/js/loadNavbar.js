// loadNavbar.js
function loadNavbar() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '/home/navbar', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            document.querySelector('.sidebar-container').innerHTML = xhr.responseText;
        } else {
            console.error('Failed to load navbar:', xhr.status, xhr.statusText);
        }
    };
    xhr.send();
}

document.addEventListener('DOMContentLoaded', loadNavbar);
