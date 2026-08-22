package sn.prestasen.service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class SmsService {

    @Value("${sms.twilio.account-sid}")
    private String accountSid;

    @Value("${sms.twilio.auth-token}")
    private String authToken;

    @Value("${sms.twilio.from-number}")
    private String fromNumber;

    @PostConstruct
    public void init() {
        if (accountSid != null && !accountSid.isBlank()) {
            Twilio.init(accountSid, authToken);
        }
    }

    public void envoyerCodeOtp(String telephone, String code) {
        String texte = "Votre code de vérification Prestasen est : " + code
                + ". Il expire dans 10 minutes.";

        try {
            Message.creator(
                    new PhoneNumber(telephone),
                    new PhoneNumber(fromNumber),
                    texte
            ).create();
            log.info("SMS OTP envoyé à {}", telephone);
        } catch (Exception e) {
            log.error("Échec de l'envoi du SMS à {} : {}", telephone, e.getMessage());
            throw new RuntimeException("Impossible d'envoyer le SMS de vérification");
        }
    }
}
