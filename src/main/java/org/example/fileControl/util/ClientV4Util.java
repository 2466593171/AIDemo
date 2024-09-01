package org.example.fileControl.util;

import com.zhipu.oapi.ClientV4;
import org.example.fileControl.common.AiChatConfig;

public class ClientV4Util {
    private static final ClientV4 client = new ClientV4.Builder(AiChatConfig.ZHIPU_API_KEY).build();

    public static ClientV4 getClient() {
        return client;
    }


}
