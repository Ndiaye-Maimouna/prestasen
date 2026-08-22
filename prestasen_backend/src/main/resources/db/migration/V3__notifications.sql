CREATE TABLE notifications (
                               id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                               utilisateur_id UUID NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
                               type VARCHAR(30) NOT NULL CHECK (type IN ('NOUVEL_AVIS', 'REPONSE_AVIS', 'BIENVENUE')),
                               titre VARCHAR(255) NOT NULL,
                               corps VARCHAR(500) NOT NULL,
                               lue BOOLEAN NOT NULL DEFAULT false,
                               date_creation TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_notifications_utilisateur ON notifications(utilisateur_id, date_creation DESC);