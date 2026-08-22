package sn.prestasen.repository;

import sn.prestasen.entity.OtpCode;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface OtpCodeRepository extends JpaRepository<OtpCode, UUID> {

    Optional<OtpCode> findTopByTelephoneAndCodeAndUtiliseFalseOrderByDateCreationDesc(String telephone, String code);
}
