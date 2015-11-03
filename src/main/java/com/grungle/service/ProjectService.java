package com.grungle.service;

import com.grungle.social.SocialPlatform;
import org.eclipse.egit.github.core.Repository;
import org.eclipse.egit.github.core.client.GitHubClient;
import org.eclipse.egit.github.core.service.RepositoryService;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

@Service
public class ProjectService {

    @Inject
    private SocialProfileService socialProfileService;

    public List<Repository> getRepos() throws IOException {
        String credentials = socialProfileService.getAccessToken(SocialPlatform.GITHUB);
        if (credentials == null) return null;

        GitHubClient client = new GitHubClient();
        client.setOAuth2Token(credentials);

        RepositoryService repoService = new RepositoryService(client);
        return repoService.getRepositories();
    }
}
