package org.example.fileControl.Factory.AIChatFactory;

import org.example.fileControl.common.AiChatConfig;

public class AIClientFactory {
    public static AIClient getAIClient(String type) {
        switch (type) {
            case AiChatConfig.RAPID_TYPE:
                return new RapidAPIClient();

            case AiChatConfig.GLM_4_Flash:
            case AiChatConfig.ModelChatGLM4:
                return new ZhiPuAPIClient();

            default:
                throw new IllegalArgumentException("Unknown AI client type: " + type);
        }
    }
}