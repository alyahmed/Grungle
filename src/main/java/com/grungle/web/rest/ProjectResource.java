package com.grungle.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.grungle.service.ProjectService;
import org.eclipse.egit.github.core.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api")
public class ProjectResource {

    private static final Logger LOG = LoggerFactory.getLogger(ProjectResource.class);

    @Inject
    private ProjectService projectService;


    /**
     * GET  /projects -> get all projects.
     */
    @RequestMapping(value = "/projects",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<?> getAll() {
        try {
            List<Repository> repos = projectService.getRepos();
            return new ResponseEntity<>(repos, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
