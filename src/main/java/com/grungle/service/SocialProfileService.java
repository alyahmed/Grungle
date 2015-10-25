package com.grungle.service;

import com.grungle.domain.SocialProfile;
import com.grungle.domain.User;
import com.grungle.repository.SocialProfileRepository;
import com.grungle.security.SecurityUtils;
import com.grungle.social.SocialPlatform;
import com.grungle.web.rest.dto.user.GithubUser;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Optional;

@Service
public class SocialProfileService {

    @Inject
    private SocialProfileRepository socialProfileRepository;


    /**
     * Look up a users access token for a particular social platform (if registered).
     * @param platform
     * @return
     */
    public String getAccessToken(SocialPlatform platform) {
        Optional<SocialProfile> socialProfile = socialProfileRepository.findByEmailAndPlatform(SecurityUtils.getCurrentLogin(), platform);
        return (socialProfile.isPresent() ? socialProfile.get().getAccessToken() : null);
    }

    @Async
    public void saveSocialProfile(GithubUser ghUser, User user, String accessToken) {
        Optional<SocialProfile> dbProfile = socialProfileRepository.findByEmailAndPlatform(ghUser.getEmail(), SocialPlatform.GITHUB);
        if (dbProfile.isPresent()) {
            SocialProfile profile = dbProfile.get();
            if (!accessToken.equals(profile.getAccessToken())) {
                profile.setAccessToken(accessToken);
                socialProfileRepository.save(profile);
            }
        } else {
            SocialProfile profile = new SocialProfile(SocialPlatform.GITHUB, ghUser.getEmail(), ghUser.getLogin(), null,
                null, user, ghUser.getAvatarUrl(), accessToken);
            socialProfileRepository.save(profile);
        }
    }

}
