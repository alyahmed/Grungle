package com.grungle.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.grungle.social.SocialPlatform;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by ahmedaly on 2015-10-21.
 */
@Entity
@Table(name = "T_SOCIAL_PROFILE")
public class SocialProfile implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Enumerated(EnumType.STRING)
    private SocialPlatform platform;

    private String email;

    @Column(name = "platform_login")
    private String platformLogin;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @JsonIgnore
    @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "registered_user", nullable = false)
    private User registeredUser;

    @Column(name = "image_url")
    private String imageUrl;

    @JsonIgnore
    @Column(name = "access_token", nullable = false)
    private String accessToken;

    public SocialProfile() {
    }

    public SocialProfile(SocialPlatform platform, String email, String platformLogin,
                         String firstName, String lastName, User registeredUser, String imageUrl, String accessToken) {
        this.platform = platform;
        this.email = email;
        this.platformLogin = platformLogin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.registeredUser = registeredUser;
        this.imageUrl = imageUrl;
        this.accessToken = accessToken;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public SocialPlatform getPlatform() {
        return platform;
    }

    public void setPlatform(SocialPlatform platform) {
        this.platform = platform;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public User getRegisteredUser() {
        return registeredUser;
    }

    public void setRegisteredUser(User registeredUser) {
        this.registeredUser = registeredUser;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getPlatformLogin() {
        return platformLogin;
    }

    public void setPlatformLogin(String platformLogin) {
        this.platformLogin = platformLogin;
    }

    @Override
    public String toString() {
        return "SocialProfile{" +
            "id=" + id +
            ", platform=" + platform +
            ", email='" + email + '\'' +
            ", firstName='" + firstName + '\'' +
            ", lastName='" + lastName + '\'' +
            ", registeredUser=" + registeredUser +
            ", imageUrl='" + imageUrl + '\'' +
            '}';
    }
}
