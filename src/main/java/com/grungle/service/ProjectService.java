package com.grungle.service;

import com.grungle.repository.SocialProfileRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

/**
 * Created by ahmedaly on 2015-10-21.
 */
@Service
public class ProjectService {

    @Inject
    private SocialProfileRepository socialProfileRepository;

}
