package com.dangun.miniproject.repository;

import com.dangun.miniproject.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface  MemberRepository extends JpaRepository<Member, Long> {

    Boolean existsByEmail(String email);

    Member findByEmail(String email);

    Boolean existsByNickname(String nickname);
}
