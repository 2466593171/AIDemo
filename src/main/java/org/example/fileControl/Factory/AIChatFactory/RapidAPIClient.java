package org.example.fileControl.Factory.AIChatFactory;

import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.common.AiChatConfig;
import org.example.fileControl.dao.entity.Rapid;
import org.example.fileControl.util.HttpClientUtil;
import org.example.fileControl.util.JsonUtil;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
public class RapidAPIClient implements AIClient{

    private static final String API_URL = "https://infinite-gpt.p.rapidapi.com/infinite-gpt";

    @Override
    public String getResponse(String query) throws Exception {

        Rapid rapid=null;


        HttpRequest request = HttpRequest.newBuilder().uri(URI.create("https://infinite-gpt.p.rapidapi.com/infinite-gpt"))
                .header("x-rapidapi-key", AiChatConfig.RAPID_API_KEY)
                .header("x-rapidapi-host", "infinite-gpt.p.rapidapi.com")
                .header("Content-Type", "application/json")
                .method("POST", HttpRequest.BodyPublishers.ofString("{\"query\":\"" + query + "\",\"sysMsg\":\"You are a friendly Chatbot.\"}"))
                .build();

        HttpResponse<String> response = null;
        try {
            response = HttpClientUtil.getHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        try {
            // 将 JSON 字符串转换为对象
            rapid = JsonUtil.getObjectMapper().readValue(response.body(), Rapid.class);
            // 打印对象的内容
            log.info("rapid.isClientError():{}",rapid.isClientError());
            log.info("rapid.isClientError():{}",rapid.isClientError());
            log.info("rapid.msg:{}",rapid.getMsg());

        }catch (Exception e){
           log.error("rapidapi error"+e.getMessage());
        }
        return rapid.getMsg();
    }
}
