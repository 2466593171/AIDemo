package org.example.fileControl.Factory.AIPictureFactory;


import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.dao.entity.AllGResponse;
import org.example.fileControl.util.HttpClientUtil;
import org.example.fileControl.util.JsonUtil;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
public class AllGCilent implements PictureCilent{
    @Override
    public String getResponse(String query) throws Exception {
        ObjectMapper objectMapper = JsonUtil.getObjectMapper();

        // 创建请求
        String urlString = "https://api.kastg.xyz/api/ai/aiig?prompt="+query+"&n_p=(worst%20quality,%20low%20quality,%20normal%20quality,%20lowres,%20low%20details,%20oversaturated,%20undersaturated,%20overexposed,%20underexposed,%20grayscale,%20bw,%20bad%20photo,%20bad%20photography,%20bad%20art:1.4),%20(watermark,%20signature,%20text%20font,%20username,%20error,%20logo,%20words,%20letters,%20digits,%20autograph,%20trademark,%20name:1.2),%20(blur,%20blurry,%20grainy),%20morbid,%20ugly,%20asymmetrical,%20mutated%20malformed,%20mutilated,%20poorly%20lit,%20bad%20shadow,%20draft,%20cropped,%20out%20of%20frame,%20cut%20off,%20censored,%20jpeg%20artifacts,%20out%20of%20focus,%20glitch,%20duplicate,%20(airbrushed,%20cartoon,%20anime,%20semi-realistic,%20cgi,%20render,%20blender,%20digital%20art,%20manga,%20amateur:1.3),%20(3D%20,3D%20Game,%203D%20Game%20Scene,%203D%20Character:1.1),%20(bad%20hands,%20bad%20anatomy,%20bad%20body,%20bad%20face,%20bad%20teeth,%20bad%20arms,%20bad%20legs,%20deformities:1.3)";
        HttpRequest request = HttpRequest.newBuilder()
                .uri(new URI(urlString))
                .GET()
                .build();

        // 发送请求并获取响应
        HttpResponse<String> response = HttpClientUtil.getHttpClient().send(request, HttpResponse.BodyHandlers.ofString());

        AllGResponse allGResponse = objectMapper.readValue(response.body(), AllGResponse.class);

        log.info("AllGResponse:{}",allGResponse);

        if(allGResponse.getStatus().equals("true")){
            log.info(objectMapper.writeValueAsString(allGResponse.getResult().get(0).getUrl()));
            return objectMapper.writeValueAsString(objectMapper.writeValueAsString(allGResponse.getResult().get(0).getUrl()));
        }
        // 打印对象的内容

        return null;
    }
}
