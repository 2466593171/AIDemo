package org.example.fileControl.Factory.AIChatFactory;

import org.example.fileControl.common.AiChatConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AIClientFactory {

    private  final RapidAPIClient rapidAPIClient;
    private final ZhiPuAPIClient zhiPuAPIClient;

    @Autowired
    public AIClientFactory(RapidAPIClient rapidAPIClient, ZhiPuAPIClient zhiPuAPIClient) {
        this.rapidAPIClient = rapidAPIClient;
        this.zhiPuAPIClient = zhiPuAPIClient;
    }

    public  AIClient getAIClient(String type) {
        switch (type) {
            case AiChatConfig.RAPID_TYPE:
                return rapidAPIClient;

            case AiChatConfig.GLM_4_Flash:
            case AiChatConfig.ModelChatGLM4:
                return zhiPuAPIClient;

            default:
                throw new IllegalArgumentException("Unknown AI client type: " + type);
        }
    }
}