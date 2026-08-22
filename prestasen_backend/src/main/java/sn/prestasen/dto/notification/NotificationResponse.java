package sn.prestasen.dto.notification;

import sn.prestasen.entity.Notification;
import lombok.*;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NotificationResponse {
    private UUID id;
    private Notification.TypeNotification type;
    private String titre;
    private String corps;
    private Boolean lue;
    private Instant dateCreation;
}
