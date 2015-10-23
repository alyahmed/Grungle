package com.grungle.service;

import com.grungle.domain.SocialProfile;
import com.grungle.domain.User;
import com.grungle.repository.SocialProfileRepository;
import com.grungle.social.SocialPlatform;
import com.grungle.web.rest.dto.user.GithubUser;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class SocialProfileService {

    @Inject
    private SocialProfileRepository socialProfileRepository;

    @Async
    public void saveSocialProfile(GithubUser ghUser, User user, String accessToken) {
        SocialProfile existingProfile = socialProfileRepository.findByEmailAndPlatform(ghUser.getEmail(), SocialPlatform.GITHUB);
        if(existingProfile != null){
            if(existingProfile.getAccessToken() == null ||
                !existingProfile.getAccessToken().equals(accessToken)){
                existingProfile.setAccessToken(accessToken);
                socialProfileRepository.save(existingProfile);
            }
        }
        else{
        SocialProfile profile = new SocialProfile(SocialPlatform.GITHUB, ghUser.getEmail(), ghUser.getLogin(), null,
            null, user, ghUser.getAvatarUrl(), accessToken);
            socialProfileRepository.save(profile);
        }
    }

}
