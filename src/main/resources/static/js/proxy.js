const express = require('express');
const request = require('request');
const app = express();

// 代理图片请求
app.get('/proxy-image', (req, res) => {
    const imageUrl = req.query.url;
    if (imageUrl) {
        request(imageUrl).pipe(res);
    } else {
        res.status(400).send('Missing URL parameter');
    }
});

app.listen(3000, () => console.log('Proxy server running on port 3000'));
