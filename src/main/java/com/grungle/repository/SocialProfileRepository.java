package com.grungle.repository;

import com.grungle.domain.SocialProfile;
import com.grungle.social.SocialPlatform;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SocialProfileRepository extends JpaRepository<SocialProfile, Long> {

    Optional<SocialProfile> findByEmailAndPlatform(String email, SocialPlatform platform);

}
