package com.grungle.service;

import com.grungle.domain.Authority;
import com.grungle.domain.User;
import com.grungle.repository.AuthorityRepository;
import com.grungle.repository.UserRepository;
import com.grungle.repository.search.UserSearchRepository;
import com.grungle.security.AuthoritiesConstants;
import com.grungle.service.util.RandomUtil;
import com.grungle.social.SocialPlatform;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by ahmedaly on 2015-10-13.
 */
@Service
public class RegistrationService {

    private static final Logger LOG = LoggerFactory.getLogger(RegistrationService.class);

    @Inject
    private AuthorityRepository authorityRepository;

    @Inject
    private PasswordEncoder passwordEncoder;

    @Inject
    private UserRepository userRepository;

    @Inject
    private UserSearchRepository userSearchRepository;

    public User registerUser(String login,
                           String password,
                           String firstName,
                           String lastName,
                           String langKey) {

        User newUser = new User();
        Authority authority = authorityRepository.findOne(AuthoritiesConstants.USER);
        Set<Authority> authorities = new HashSet<>();
        String encryptedPassword = passwordEncoder.encode(password);
        newUser.setLogin(login);
        // new user gets initially a generated password
        newUser.setPassword(encryptedPassword);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setLangKey(langKey);
        // new user is not active
        newUser.setActivated(false);
        // new user gets registration key
        newUser.setActivationKey(RandomUtil.generateActivationKey());
        authorities.add(authority);
        newUser.setAuthorities(authorities);
        userRepository.save(newUser);
        userSearchRepository.save(newUser);
        LOG.debug("Created Information for User: {}", newUser);
        return newUser;
    }


    public User registerSocialUser(String login,
                                 String firstName,
                                 String lastName,
                                 String langKey,
                                 SocialPlatform socialProvider) {
        User newUser = new User();
        Authority authority = authorityRepository.findOne(AuthoritiesConstants.USER);
        Set<Authority> authorities = new HashSet<>();
        String encryptedPassword = passwordEncoder.encode(RandomUtil.generatePassword());
        newUser.setLogin(login);
        // new user gets initially a generated password
        newUser.setPassword(encryptedPassword);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setLangKey(langKey);
        newUser.setSocialAccount(true);
        newUser.setSocialProvider(socialProvider.name());
        // new user is not active
        newUser.setActivated(false);
        // new user gets registration key
        newUser.setActivationKey(RandomUtil.generateActivationKey());
        authorities.add(authority);
        newUser.setAuthorities(authorities);
        userRepository.save(newUser);
        userSearchRepository.save(newUser);
        LOG.debug("Created Information for User: {}", newUser);
        return newUser;
    }


}
