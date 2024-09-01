package org.example.fileControl.Factory.AIChatFactory;
import com.zhipu.oapi.ClientV4;
import com.zhipu.oapi.Constants;
import com.zhipu.oapi.service.v4.model.ChatCompletionRequest;
import com.zhipu.oapi.service.v4.model.ChatMessage;
import com.zhipu.oapi.service.v4.model.ChatMessageRole;
import com.zhipu.oapi.service.v4.model.ModelApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.common.AiChatConfig;
import org.example.fileControl.util.ClientV4Util;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;
@Slf4j
public class ZhiPuAPIClient implements AIClient {

    @Override
    public String getResponse(String query) {

        List<ChatMessage> messages = new ArrayList<>();
        ChatMessage chatMessage = new ChatMessage(ChatMessageRole.USER.value(), query);
        messages.add(chatMessage);

        ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder()
                .model(Constants.ModelChatGLM4)
                .stream(Boolean.FALSE)
                .invokeMethod(Constants.invokeMethod)
                .messages(messages)
                .build();

        ModelApiResponse invokeModelApiResp =  ClientV4Util.getClient().invokeModelApi(chatCompletionRequest);

        log.info("智普返回信息输出" + invokeModelApiResp);

        String  reply  = invokeModelApiResp.getData().getChoices().get(0).getMessage().getContent().toString();

        log.info("处理过后的信息" + reply);

        return reply;
    }
}
