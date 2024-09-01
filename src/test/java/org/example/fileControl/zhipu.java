package org.example.fileControl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhipu.oapi.ClientV4;
import com.zhipu.oapi.Constants;
import com.zhipu.oapi.service.v4.model.ChatCompletionRequest;
import com.zhipu.oapi.service.v4.model.ChatMessage;
import com.zhipu.oapi.service.v4.model.ChatMessageRole;
import com.zhipu.oapi.service.v4.model.ModelApiResponse;

import java.util.ArrayList;
import java.util.List;

public class zhipu {




    public static void main(String[] args) {


        ClientV4 client = new ClientV4.Builder("14bdc125b6e7f6f9d12aee9cbc5218a7.BoMJ4dqAhJQEuhTc").build();

        ObjectMapper objectMapper = new ObjectMapper();

        List<ChatMessage> messages = new ArrayList<>();
        ChatMessage chatMessage = new ChatMessage(ChatMessageRole.USER.value(), "讲个故事");
        messages.add(chatMessage);

        ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder()
                .model(Constants.ModelChatGLM4)
                .stream(Boolean.FALSE)
                .invokeMethod(Constants.invokeMethod)
                .messages(messages)
                .build();
        ModelApiResponse invokeModelApiResp = client.invokeModelApi(chatCompletionRequest);
        System.out.println("智普返回信息输出" + invokeModelApiResp);
        String string = invokeModelApiResp.getData().getChoices().get(0).getMessage().getContent().toString();
        System.out.println(string);
        try {
            System.out.println("model output:" + objectMapper.writeValueAsString(invokeModelApiResp));

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }
    }

