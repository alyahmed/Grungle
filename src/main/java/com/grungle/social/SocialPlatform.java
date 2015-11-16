package com.grungle.social;

/**
 * Created by ahmedaly on 2015-10-21.
 */
public enum SocialPlatform {
    GITHUB, GOOGLE, SLACK;

    public static SocialPlatform getPlatform(String name) {
        SocialPlatform[] values = SocialPlatform.values();
        for (SocialPlatform value : values) {
            if (value.name().equals(name)) {
                return value;
            }
        }
        return null;
    }
}
