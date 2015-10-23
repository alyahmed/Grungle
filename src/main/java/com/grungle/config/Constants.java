package com.grungle.config;

/**
 * Application constants.
 */
public final class Constants {

    private Constants() {
    }

    public static final String SPRING_PROFILE_DEVELOPMENT = "dev";
    public static final String SPRING_PROFILE_PRODUCTION = "prod";
    public static final String SPRING_PROFILE_FAST = "fast";
    // Spring profile used when deploying with Spring Cloud (used when deploying to CloudFoundry)
    public static final String SPRING_PROFILE_CLOUD = "cloud";
    // Spring profile used when deploying to Heroku
    public static final String SYSTEM_ACCOUNT = "system";

    public static final String GH_AUTH_URL = "https://github.com/login/oauth/access_token";
    public static final String GH_API_URL = "https://api.github.com";
    public static final String GH_USER_URL = GH_API_URL + "/user?access_token=";

}
