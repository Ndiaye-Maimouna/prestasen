CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE utilisateurs (
                              id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                              telephone VARCHAR(20) NOT NULL UNIQUE,
                              mot_de_passe VARCHAR(255) NOT NULL,
                              email VARCHAR(255),
                              prenom VARCHAR(255) NOT NULL,
                              nom VARCHAR(255) NOT NULL,
                              role VARCHAR(20) NOT NULL CHECK (role IN ('CLIENT', 'PROFESSIONNEL', 'ADMIN')),
                              photo_url TEXT,
                              region VARCHAR(100),
                              ville VARCHAR(100),
                              actif BOOLEAN NOT NULL DEFAULT true,
                              date_creation TIMESTAMP NOT NULL DEFAULT now(),
                              derniere_connexion TIMESTAMP
);

CREATE INDEX idx_utilisateurs_telephone ON utilisateurs(telephone);
CREATE INDEX idx_utilisateurs_role ON utilisateurs(role);

CREATE TABLE refresh_tokens (
                                id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                                token VARCHAR(500) NOT NULL UNIQUE,
                                utilisateur_id UUID NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
                                date_expiration TIMESTAMP NOT NULL,
                                revoque BOOLEAN NOT NULL DEFAULT false,
                                date_creation TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_refresh_tokens_token ON refresh_tokens(token);
CREATE INDEX idx_refresh_tokens_utilisateur ON refresh_tokens(utilisateur_id);

CREATE TABLE otp_codes (
                           id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                           telephone VARCHAR(20) NOT NULL,
                           code VARCHAR(6) NOT NULL,
                           date_expiration TIMESTAMP NOT NULL,
                           utilise BOOLEAN NOT NULL DEFAULT false,
                           date_creation TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_otp_codes_telephone ON otp_codes(telephone);

CREATE TABLE categories (
                            id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                            nom VARCHAR(100) NOT NULL UNIQUE,
                            icone VARCHAR(100),
                            type VARCHAR(20) NOT NULL DEFAULT 'LES_DEUX' CHECK (type IN ('SERVICE', 'PRODUIT', 'LES_DEUX'))
);

CREATE TABLE profils_professionnels (
                                        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                                        utilisateur_id UUID NOT NULL UNIQUE REFERENCES utilisateurs(id) ON DELETE CASCADE,
                                        description VARCHAR(1000),
                                        latitude DOUBLE PRECISION,
                                        longitude DOUBLE PRECISION,
                                        note_moyenne DOUBLE PRECISION NOT NULL DEFAULT 0,
                                        nombre_avis INTEGER NOT NULL DEFAULT 0,
                                        date_creation TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_profils_pro_geoloc ON profils_professionnels(latitude, longitude);

CREATE TABLE professionnel_categories (
                                          profil_professionnel_id UUID NOT NULL REFERENCES profils_professionnels(id) ON DELETE CASCADE,
                                          categorie_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
                                          PRIMARY KEY (profil_professionnel_id, categorie_id)
);

CREATE TABLE services (
                          id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                          professionnel_id UUID NOT NULL REFERENCES profils_professionnels(id) ON DELETE CASCADE,
                          titre VARCHAR(255) NOT NULL,
                          description VARCHAR(2000),
                          categorie_id UUID NOT NULL REFERENCES categories(id),
                          prix_indicatif DOUBLE PRECISION,
                          actif BOOLEAN NOT NULL DEFAULT true,
                          date_creation TIMESTAMP NOT NULL DEFAULT now(),
                          date_modification TIMESTAMP
);

CREATE INDEX idx_services_professionnel ON services(professionnel_id);
CREATE INDEX idx_services_categorie ON services(categorie_id);
CREATE INDEX idx_services_actif ON services(actif);

CREATE TABLE service_images (
                                service_id UUID NOT NULL REFERENCES services(id) ON DELETE CASCADE,
                                url TEXT NOT NULL
);

CREATE TABLE produits (
                          id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                          professionnel_id UUID NOT NULL REFERENCES profils_professionnels(id) ON DELETE CASCADE,
                          titre VARCHAR(255) NOT NULL,
                          description VARCHAR(2000),
                          categorie_id UUID NOT NULL REFERENCES categories(id),
                          prix DOUBLE PRECISION NOT NULL,
                          actif BOOLEAN NOT NULL DEFAULT true,
                          date_creation TIMESTAMP NOT NULL DEFAULT now(),
                          date_modification TIMESTAMP
);

CREATE INDEX idx_produits_professionnel ON produits(professionnel_id);
CREATE INDEX idx_produits_categorie ON produits(categorie_id);
CREATE INDEX idx_produits_actif ON produits(actif);

CREATE TABLE produit_images (
                                produit_id UUID NOT NULL REFERENCES produits(id) ON DELETE CASCADE,
                                url TEXT NOT NULL
);

CREATE TABLE avis (
                      id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                      auteur_id UUID NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
                      professionnel_id UUID NOT NULL REFERENCES profils_professionnels(id) ON DELETE CASCADE,
                      note INTEGER NOT NULL CHECK (note BETWEEN 1 AND 5),
                      commentaire VARCHAR(1000),
                      reponse_professionnel VARCHAR(1000),
                      date_reponse TIMESTAMP,
                      date_creation TIMESTAMP NOT NULL DEFAULT now(),
                      CONSTRAINT uq_avis_auteur_professionnel UNIQUE (auteur_id, professionnel_id)
);

CREATE INDEX idx_avis_professionnel ON avis(professionnel_id);

CREATE TABLE fcm_tokens (
                            id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                            utilisateur_id UUID NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
                            token VARCHAR(500) NOT NULL,
                            date_creation TIMESTAMP NOT NULL DEFAULT now(),
                            CONSTRAINT uq_fcm_token UNIQUE (utilisateur_id, token)
);

-- Données de référence : catégories de base
INSERT INTO categories (nom, type, icone) VALUES
                                              ('Plomberie', 'SERVICE', 'plomberie'),
                                              ('Électricité', 'SERVICE', 'electricite'),
                                              ('Menuiserie', 'SERVICE', 'menuiserie'),
                                              ('Développement web', 'SERVICE', 'developpement'),
                                              ('Graphisme', 'SERVICE', 'graphisme'),
                                              ('Couture', 'LES_DEUX', 'couture'),
                                              ('Pâtisserie', 'LES_DEUX', 'patisserie'),
                                              ('Bijoux artisanaux', 'PRODUIT', 'bijoux'),
                                              ('Produits locaux', 'PRODUIT', 'produits_locaux'),
                                              ('Sérigraphie', 'LES_DEUX', 'serigraphie');