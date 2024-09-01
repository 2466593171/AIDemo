package org.example.fileControl.util;


import java.net.http.HttpClient;

public class HttpClientUtil {

    // 私有化构造器，防止实例化
    private HttpClientUtil() {}

    // 静态方法返回 HttpClient 实例
    public static HttpClient getHttpClient() {
        return HttpClient.newHttpClient();
    }
}