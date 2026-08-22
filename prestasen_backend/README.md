# Prestasen : Backend

API REST pour Prestasen, plateforme de mise en relation entre clients et prestataires de services locaux au Sénégal.

## Stack technique

- **Java 21**
- **Spring Boot 3.3** (Web, Security, Data JPA, Validation)
- **PostgreSQL 15+**
- **Flyway** : gestion des migrations de base de données
- **JWT** (jjwt) : authentification par access/refresh token
- **MapStruct** : mapping entités ↔ DTOs
- **Lombok**
- **Firebase Admin SDK** : notifications push
- **Twilio** : envoi de SMS (réinitialisation de mot de passe)
- **springdoc-openapi** : documentation API (Swagger UI)

## Prérequis

- JDK 21
- Maven (ou utiliser le wrapper `./mvnw` fourni)
- PostgreSQL 15+ installé et lancé
- Un projet Firebase (pour les notifications push)
- Un compte Twilio (optionnel : nécessaire uniquement pour le flow "mot de passe oublié")

### Lancer l'application

```bash
./mvnw spring-boot:run
```

Flyway exécute automatiquement les migrations au démarrage (création du schéma + données de référence : catégories).

```bash
curl http://localhost:8080/api/categories
```

## Documentation de l'API

Une fois l'application lancée, Swagger UI est disponible sur :
```
http://localhost:8080/swagger-ui.html
```

## Structure du projet

```
src/main/java/com/prestasen/
├── config/          # Configuration Spring (sécurité, CORS, OpenAPI, Firebase)
├── security/        # JWT (génération, validation, filtre d'authentification)
├── entity/          # Entités JPA
├── repository/      # Repositories Spring Data JPA
├── specification/   # Specifications JPA (filtres de recherche dynamiques)
├── dto/             # Objets de transfert (requêtes/réponses par domaine)
├── mapper/          # Mappers MapStruct (entité ↔ DTO)
├── service_layer/   # Logique métier
├── controller/      # Contrôleurs REST
├── exception/       # Exceptions custom + gestion d'erreurs centralisée
└── util/            # Utilitaires (téléphone, coordonnées régionales, dispersion géographique)

src/main/resources/
├── application.yml
├── db/migration/    # Migrations Flyway
└── firebase-service-account.json
```

## Variables d'environnement

| Variable | Obligatoire | Description |
|---|---|---|
| `DB_USERNAME` | Oui | Utilisateur PostgreSQL |
| `DB_PASSWORD` | Oui | Mot de passe PostgreSQL |
| `JWT_SECRET` | Oui | Clé de signature JWT (256 bits minimum recommandé) |
| `TWILIO_ACCOUNT_SID` | Non | Nécessaire pour l'envoi de SMS |
| `TWILIO_AUTH_TOKEN` | Non | Nécessaire pour l'envoi de SMS |
| `TWILIO_FROM_NUMBER` | Non | Numéro expéditeur Twilio |

Créer un fichier `.env` à la racine du projet avec :

```env
TWILIO_ACCOUNT_SID=un_account_sid
TWILIO_AUTH_TOKEN=un_auth_token
TWILIO_FROM_NUMBER=un_numero
```

## Configuration Firebase

Le projet utilise Firebase Admin SDK pour les notifications push.

Le fichier `firebase-service-account.json` n'est pas inclus dans le dépôt GitHub pour des raisons de sécurité.

Après avoir cloné le projet, vous devez :

1. Accéder à un projet Firebase.
2. Aller dans **Project settings → Service accounts**.
3. Générer une nouvelle clé privée.
4. Télécharger le fichier JSON.
5. Le placer dans :

```text
src/main/resources/firebase-service-account.json