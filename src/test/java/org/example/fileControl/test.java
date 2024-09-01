package org.example.fileControl;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class test {


    public static void main(String[] args) {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://chat-gtp-free.p.rapidapi.com/v1/chat/completions"))
                .header("x-rapidapi-key", "fe5534cec0msh93c555586541158p10130cjsn5fdfd20e6815")
                .header("x-rapidapi-host", "chat-gtp-free.p.rapidapi.com")
                .header("Content-Type", "application/json")
                .method("POST", HttpRequest
                        .BodyPublishers
                        .ofString("{\"chatId\":\"92d97036-3e25-442b-9a25-096ab45b0525\",\"messages\":[{\"role\":\"user\",\"content\":\"hello\"}]}"))
                .build();
        HttpResponse<String> response = null;
        try {
            response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        System.out.println(response.body());
    }

}
