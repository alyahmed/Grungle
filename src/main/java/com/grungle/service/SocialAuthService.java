package com.grungle.service;

import com.grungle.config.Constants;
import com.grungle.domain.User;
import com.grungle.repository.UserRepository;
import com.grungle.security.social.GithubTokenRequest;
import com.grungle.security.social.GithubTokenResponse;
import com.grungle.security.xauth.Token;
import com.grungle.security.xauth.TokenProvider;
import com.grungle.social.SocialPlatform;
import com.grungle.web.rest.dto.user.GithubUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.inject.Inject;
import java.util.Optional;


@Service
public class SocialAuthService {

    private static final Logger LOG = LoggerFactory.getLogger(SocialAuthService.class);

    @Inject
    private RestTemplate restTemplate;

    @Inject
    private RegistrationService registrationService;

    @Inject
    private UserRepository userRepository;

    @Inject
    private TokenProvider tokenProvider;

    @Inject
    private UserDetailsService userDetailsService;

    @Inject
    private SocialProfileService socialProfileService;


    public Token getTokenResponse(String code, SocialPlatform platform) {
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        headers.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
        GithubTokenRequest req = new GithubTokenRequest(code);
        HttpEntity<GithubTokenRequest> request = new HttpEntity<>(req, headers);
        GithubTokenResponse response = restTemplate.postForObject(Constants.GH_AUTH_URL, request, GithubTokenResponse.class);
        LOG.debug("Getting user Object using access token = {}", response.getAccessToken());
        GithubUser ghUser = getUser(response.getAccessToken());
        User user;
        Optional<User> dbUser = userRepository.findOneByLogin(ghUser.getEmail());
        if (!dbUser.isPresent()) {
            // Register
            user = registrationService.registerSocialUser(ghUser.getEmail(), getFirstName(ghUser.getName()), null, "en", SocialPlatform.GITHUB);
        } else {
            // Already registered, just log them in
            user = dbUser.get();
        }
        //TODO: Fix this messy logic with social account login
        saveSocialProfile(ghUser, user, response.getAccessToken());
        return createToken(user.getLogin());
    }

    private void saveSocialProfile(GithubUser ghUser, User user, String accessToken) {
        socialProfileService.saveSocialProfile(ghUser, user, accessToken);
    }

    private Token createToken(String login) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(login);
        return tokenProvider.createToken(userDetails);
    }

    private String getFirstName(String name) {
        return name.split(" ")[0];
    }

    public GithubUser getUser(String accessToken) {
        String url = Constants.GH_USER_URL + accessToken;
        ResponseEntity<GithubUser> response = restTemplate.getForEntity(url, GithubUser.class);
        LOG.debug("Obtained Github user = {}", response);
        return response.getBody();
    }

}
