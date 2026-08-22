# Prestasen

### Maïmouna Ndiaye, DIC 2 GIT 2025-2026

Prestasen est une plateforme de mise en relation entre clients et prestataires de services locaux au Sénégal. Le projet se compose de deux parties : une application mobile (Flutter) et une API REST (Spring Boot).

## Structure du dépôt

```
prestasen/
├── prestasen_frontend/     # Application mobile Flutter
├── prestasen_backend/      # API REST Spring Boot
└── README.md     
```

> **Chaque projet possède son propre README détaillé.** Ce fichier ne fait qu'un survol global ; pour l'installation, la configuration et les commandes spécifiques, se référer directement aux README de chaque dossier :
> - [`prestasen_frontend/README.md`](prestasen_frontend/README.md) : installation Flutter, configuration Firebase, variables d'environnement, structure du code
> - [`prestasen_backend/README.md`](prestasen_backend/README.md) : installation Spring Boot, base de données PostgreSQL, configuration Firebase, Twilio, documentation Swagger

## Stack technique

| | Technologies |
|---|---|
| **Frontend** | Flutter 3.24+ / Dart 3.4+, Riverpod, go_router, Dio, Freezed, flutter_map, Firebase Messaging |
| **Backend** | Java 21, Spring Boot 3.3, PostgreSQL 15+, Flyway, JWT, MapStruct, Firebase Admin SDK, Twilio |

## Démarrage rapide

L'ordre recommandé pour lancer le projet en local :

1. **Backend** : lancer PostgreSQL, configurer les variables d'environnement et Firebase, puis démarrer l'API (voir [`prestasen_backend/README.md`](prestasen_backend/README.md))
   ```bash
   cd prestasen_backend
   ./mvnw spring-boot:run
   ```
   L'API est disponible sur `http://localhost:8080` et sa documentation Swagger sur `http://localhost:8080/swagger-ui.html`.

2. **Frontend** : configurer Firebase et le fichier `.env` (URL de l'API), puis lancer l'application (voir [`prestasen_frontend/README.md`](prestasen_frontend/README.md))
   ```bash
   cd prestasen_frontend
   flutter pub get
   flutter run
   ```

Le frontend doit pointer vers l'API backend via la variable `API_BASE_URL` (voir détails dans `prestasen_frontend/README.md` selon émulateur Android, simulateur iOS ou appareil physique).

## Prérequis communs

- Un projet Firebase (le même pour le frontend et le backend)
- Le backend lancé avant le frontend, pour que les appels API fonctionnent