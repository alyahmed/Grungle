package com.grungle.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.grungle.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;

/**
 * Created by ahmedaly on 2015-10-12.
 */
@RestController
@RequestMapping("/pub")
public class PubResource {

    private static final Logger log = LoggerFactory.getLogger(PubResource.class);

    @Inject
    private UserRepository userRepository;

    @Inject
    private PasswordEncoder passwordEncoder;


    /**
     * GET  /users -> get all users.
     */
    @RequestMapping(value = "/test",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<?> getAll() {
        log.debug("REST request to get all Users");
        userRepository.findOneByLogin("admin").ifPresent(u -> {
            String encryptedPassword = passwordEncoder.encode("admin");
            u.setPassword(encryptedPassword);
            userRepository.save(u);
            log.debug("Changed password for User: {}", u);
        });
        return new ResponseEntity<>("CHANGED", HttpStatus.OK);
    }
}
