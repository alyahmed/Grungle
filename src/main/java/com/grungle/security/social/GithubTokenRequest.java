package com.grungle.security.social;

import com.fasterxml.jackson.annotation.JsonProperty;

public class GithubTokenRequest {

    private String code;

    @JsonProperty("client_id")
    private String clientId = "10d3d0f1fbc5c1bc5b4b";

    @JsonProperty("client_secret")
    private String clientSecret = "4fafe688b258f50302f368e240ed2f062825b438";

    public GithubTokenRequest() {
    }

    public GithubTokenRequest(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }
}
