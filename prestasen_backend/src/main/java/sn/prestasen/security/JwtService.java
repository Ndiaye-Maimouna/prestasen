package sn.prestasen.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
public class JwtService {

    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.access-token-expiration}")
    private long accessTokenExpiration;

    private SecretKey getSigningKey() {
        return Keys.hmacShaKeyFor(secret.getBytes());
    }

    public String genererAccessToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("type", "access");
        return construireToken(claims, userDetails.getUsername(), accessTokenExpiration);
    }

    private String construireToken(Map<String, Object> claims, String subject, long expiration) {
        Date maintenant = new Date();
        Date expirationDate = new Date(maintenant.getTime() + expiration);

        return Jwts.builder()
                .claims(claims)
                .subject(subject)
                .issuedAt(maintenant)
                .expiration(expirationDate)
                .signWith(getSigningKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public String extraireTelephone(String token) {
        try {
            return extraireClaim(token, Claims::getSubject);
        } catch (ExpiredJwtException | MalformedJwtException | SignatureException | UnsupportedJwtException e) {
            return null;
        }
    }

    public <T> T extraireClaim(String token, Function<Claims, T> claimsResolver) {
        Claims claims = extraireToutesLesClaims(token);
        return claimsResolver.apply(claims);
    }

    private Claims extraireToutesLesClaims(String token) {
        return Jwts.parser()
                .verifyWith(getSigningKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    public boolean estValide(String token, UserDetails userDetails) {
        try {
            final String telephone = extraireTelephone(token);
            return telephone != null && telephone.equals(userDetails.getUsername()) && !estExpire(token);
        } catch (Exception e) {
            return false;
        }
    }

    private boolean estExpire(String token) {
        return extraireClaim(token, Claims::getExpiration).before(new Date());
    }
}
