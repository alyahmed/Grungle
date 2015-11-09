package com.grungle.security.xauth;

/**
 * The security token.
 */
public class Token {

    String token;
    long expires;
    boolean social = false;

    public Token(String token, long expires){
        this.token = token;
        this.expires = expires;
    }

    public Token(String token, long expires, boolean social) {
        this.token = token;
        this.expires = expires;
        this.social = social;
    }

    public boolean isSocial() {
        return social;
    }


    public String getToken() {
        return token;
    }

    public long getExpires() {
        return expires;
    }
}
