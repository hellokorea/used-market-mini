package com.dangun.miniproject.jwt;

import io.jsonwebtoken.Jwts;
import lombok.extern.slf4j.Slf4j;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
@Slf4j
public class JWTUtil {

    private SecretKey secretKey;

    public JWTUtil(@Value("${jwt.secretKey}")String secret) {
        secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8), Jwts.SIG.HS256.key().build().getAlgorithm());
    }

    // 토큰 내 member email 추출
    public String getMemberEmail(String token) {
        return Jwts.parser()
                .verifyWith(secretKey)
                .build()
                .parseSignedClaims(token)
                .getPayload().get("email", String.class);
    }

    // 만료 시간 검증
    public Boolean isExpiredToken(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(secretKey)
                    .build()
                    .parseClaimsJws(token)
                    .getBody().getExpiration()
                    .before(new Date());
        } catch (Exception e) {
            log.warn("토큰 파싱 중 예외 발생: " + e.getMessage());
            return true;
        }
    }

    // 토큰 생성
    public String createJwt(String email, Long expireTime) {
        return Jwts.builder()
                .claim("email", email)
                .issuedAt(new Date(System.currentTimeMillis())) // 발행 시간
                .expiration(new Date(System.currentTimeMillis() + expireTime)) // 만료 시간
                .signWith(secretKey) // 시그니쳐
                .compact();
    }
}