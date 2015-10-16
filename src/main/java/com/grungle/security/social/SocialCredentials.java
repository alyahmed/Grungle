package com.grungle.security.social;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.validation.constraints.NotNull;

/**
 * Created by ahmedaly on 2015-10-12.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class SocialCredentials {

    @NotNull
    private String clientId;

    @NotNull
    private String code;

    @NotNull
    private String redirectUrl;

    public SocialCredentials() {
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    @Override
    public String toString() {
        return "SocialCredentials{" +
                "redirectUrl='" + redirectUrl + '\'' +
                ", code='" + code + '\'' +
                ", clientId='" + clientId + '\'' +
                '}';
    }
}
