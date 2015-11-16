package com.grungle.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.grungle.security.social.SocialCredentials;
import com.grungle.security.xauth.Token;
import com.grungle.security.xauth.TokenProvider;
import com.grungle.service.SocialAuthService;
import com.grungle.social.SocialPlatform;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

@RestController
@RequestMapping("/api")
public class UserXAuthTokenController {

    private static final Logger LOG = LoggerFactory.getLogger(UserXAuthTokenController.class);

    @Inject
    private TokenProvider tokenProvider;

    @Inject
    private AuthenticationManager authenticationManager;

    @Inject
    private UserDetailsService userDetailsService;

    @Inject
    private SocialAuthService socialAuthService;

    @RequestMapping(value = "/authenticate",
            method = RequestMethod.POST)
    @Timed
    public Token authorize(@RequestParam String username, @RequestParam String password) {

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authentication = this.authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        UserDetails details = this.userDetailsService.loadUserByUsername(username);
        return tokenProvider.createToken(details);
    }

    @RequestMapping(value = "/auth",
            method = RequestMethod.POST)
    @Timed
    public Token refresh(@RequestParam String authToken) {
        String username = tokenProvider.getUserNameFromToken(authToken);
        UserDetails details = userDetailsService.loadUserByUsername(username);
        if (tokenProvider.validateToken(authToken, details)) {
            return tokenProvider.createToken(details);
        }
        throw new BadCredentialsException("Invalid Token provided");
    }


    @RequestMapping(value = "/oauth/{provider}",
        method = RequestMethod.GET)
    public ResponseEntity<?> oAuthHandler(@PathVariable("provider") final String provider, @RequestParam String code) {
        LOG.info("Attempting OAuth Authentication flow for provider = {} with code = {}", provider, code);
        return ResponseEntity.ok(null);
    }


    @RequestMapping(value = "/auth/{provider}",
            method = RequestMethod.POST)
    @Timed
    public ResponseEntity<?> socialAuthorization(@PathVariable("provider") final String provider, @RequestBody SocialCredentials creds) {
        LOG.info("Authenticating provider {} with code = {}", provider, creds.getCode());
        Token token = socialAuthService.getTokenResponse(creds.getCode(), SocialPlatform.getPlatform(provider));
        return new ResponseEntity<>(token, HttpStatus.OK);
    }
}
