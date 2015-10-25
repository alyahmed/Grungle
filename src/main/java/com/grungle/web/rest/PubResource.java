package com.grungle.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.grungle.config.Constants;
import com.grungle.web.rest.dto.user.GithubUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.inject.Inject;

/**
 * Created by ahmedaly on 2015-10-12.
 */
@RestController
@RequestMapping("/pub")
public class PubResource {

    private static final Logger LOG = LoggerFactory.getLogger(PubResource.class);

    @Inject
    private RestTemplate restTemplate;


    /**
     * GET  /users -> get all users.
     */
    @RequestMapping(value = "/gh_user",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<?> getAll(@RequestParam final String accessToken) {
        String url = Constants.GH_USER_URL + accessToken;
        ResponseEntity<GithubUser> response = restTemplate.getForEntity(url, GithubUser.class);
        LOG.debug("Obtained Github user = {}", response);
        return new ResponseEntity<>(response.getBody(), HttpStatus.OK);
    }


}
