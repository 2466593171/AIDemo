package org.example.fileControl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringEscapeUtils;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;

public class chat1 {

    public static void main(String[] args) throws JsonProcessingException {
//        System.out.println("你好，世界！");
//        HttpRequest request = HttpRequest.newBuilder()
//                .uri(URI.create("https://infinite-gpt.p.rapidapi.com/infinite-gpt"))
//                .header("x-rapidapi-key", "fe5534cec0msh93c555586541158p10130cjsn5fdfd20e6815")
//                .header("x-rapidapi-host", "infinite-gpt.p.rapidapi.com")
//                .header("Content-Type", "application/json")
//                .method("POST", HttpRequest.BodyPublishers.ofString("{\"query\":\"你可以说中文么\",\"sysMsg\":\"You are a friendly Chatbot.\"}"))
//                .build();
//        HttpResponse<String> response = null;
//        try {
//            response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
//        try {
//            System.out.println(response);
//            System.out.println(response.body());
//            System.out.println(new String(response.body().getBytes(), "UTF-8"));
//            System.out.println(response.body().getBytes(StandardCharsets.UTF_8));
//        } catch (UnsupportedEncodingException e) {
//            throw new RuntimeException(e);
//        }
//
//        String result = null;
//        try {
//            result = StringEscapeUtils.unescapeJava(new String(response.body().getBytes(), "UTF-8"));
//        } catch (UnsupportedEncodingException e) {
//            throw new RuntimeException(e);
//        }
//
//        System.out.println(result);
//    }

        String jsonResponse = "{\n" +
                "  \"clientError\": false,\n" +
                "  \"msg\": \"\\u6211\\u53ef\\u4ee5\\u8bf4\\u4e2d\\u6587\\uff0c\\u8bf7\\u8f93\\u5165\\u60a8\\u8981\\u95ee\\u7684\\u5185\\u5bb9\\uff0c\\u6211\\u4f1a\\u5c3d\\u529b\\u5e2e\\u52a9\\u60a8\\uff01\\n\\n\\u4f60\\u53ef\\u4ee5\\u968f\\u65f6\\u8f93\\u5165\\u4e2d\\u6587\\u6216\\u82f1\\u6587\\uff0c\\u6211\\u4f1a\\u6309\\u7167\\u60a8\\u7684\\u8bed\\u8a00\\u9009\\u9879\\u56de\\u590d\\u60a8\\u3002\\n\\n\\u4f8b\\u5982\\uff0c\\u60a8\\u53ef\\u4ee5\\u8f93\\u5165\\uff1a\\n\\n1. \\u4f60\\u597d\\uff0c\\u8bf7\\u95ee\\u8fd9\\u4e2a\\u4ea7\\u54c1\\u662f\\u5426\\u6709\\u8d27\\uff1f\\n2. How's it going? Is this product in stock?\\n\\n\\u6211\\u90fd\\u53ef\\u4ee5\\u7406\\u89e3\\u5e76\\u56de\\u590d\\u60a8\\uff01\",\n" +
                "  \"serverError\": false\n" +
                "}";

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // 将 JSON 字符串转换为 Chat15 对象
            chat15 chat15 = objectMapper.readValue(jsonResponse, chat15.class);

            // 打印对象的内容
            System.out.println("Client Error: " + chat15.isClientError());
            System.out.println("Server Error: " + chat15.isServerError());

            // 打印转换后的消息内容
            System.out.println("Message: " + chat15.getMsg());
        }finally {
            System.out.println("finally");
        }
    }
}