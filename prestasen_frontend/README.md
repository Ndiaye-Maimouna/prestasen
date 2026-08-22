# Prestasen : Frontend (Flutter)

Application mobile Prestasen : plateforme de mise en relation entre clients et prestataires de services locaux au Sénégal.

## Stack technique

- **Flutter 3.24+** / Dart 3.4+
- **Riverpod** (`flutter_riverpod` + `riverpod_generator`) : state management et injection de dépendances
- **go_router** : navigation déclarative
- **Dio** : client HTTP
- **Freezed** + **json_serializable** : modèles immuables
- **flutter_map** : carte (fond OpenStreetMap)
- **firebase_messaging** + **flutter_local_notifications** : notifications push
- **flutter_secure_storage** : stockage sécurisé des tokens JWT
- **lucide_icons_flutter** : icônes

## Prérequis

- Flutter SDK 3.24 ou supérieur
- Un émulateur Android/simulateur iOS configuré, ou un appareil physique
- Le backend Prestasen lancé
- Un projet Firebase (le même que celui utilisé côté backend)

## Installation

### Récupérer les dépendances

```bash
flutter pub get
```

### Connecter Firebase

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
Sélectionnez le même projet Firebase que le backend. Génère automatiquement `lib/firebase_options.dart`.

### Fichier `.env`

Crée un fichier `.env` à la racine du projet :

```
API_BASE_URL=http://10.0.2.2:8080/api
```

- **Émulateur Android** : gardez `10.0.2.2` (pointe vers le `localhost` de la machine hôte)
- **Simulateur iOS** : remplacez par `http://localhost:8080/api`
- **Appareil physique** : remplacez par l'IP locale de ta machine sur le réseau Wi-Fi (ex: `http://192.168.1.42:8080/api`)

### Génération de code

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Structure du projet

```
lib/
├── main.dart
│
├── core/                      # Infrastructure transverse, sans logique métier
│   ├── network/                # Client Dio, intercepteur auth, gestion d'erreurs réseau
│   ├── storage/                 # Stockage sécurisé (tokens), préférences locales
│   ├── router/                  # Configuration go_router, shell principal
│   ├── providers/                # Providers Riverpod globaux
│   ├── theme/                   # Thème Material
│   ├── constants/                # Couleurs, tailles, chaînes de caractères
│   ├── utils/                    # Formatters, WhatsApp helper, validateurs
│   ├── config/                   # Config environnement, régions du Sénégal
│   ├── errors/                   # Modèle Failure + mapping des erreurs Dio
│   ├── notifications/           # Service de notifications push
│   └── location/                 # Service de géolocalisation
│
├── shared/
│   └── widgets/                # Composants réutilisables entre features
│
├── features/                  # Un dossier par domaine métier
│   ├── auth/                    # Connexion, inscription, mot de passe
│   ├── profil/                   # Profil utilisateur, paramètres
│   ├── professionnels/           # Recherche, profil pro, édition profil pro
│   ├── services/                  # CRUD services, détail, recherche
│   ├── produits/                  # CRUD produits, détail, recherche
│   ├── avis/                       # Avis et notation
│   ├── carte/                      # Carte interactive
│   ├── categories/                  # Catégories de référence
│   ├── notifications/               # Centre de notifications
│   └── accueil/                      # Écran d'accueil
│
└── firebase_options.dart      # Généré par flutterfire configure
```

Chaque feature suit la même convention interne :
```
features/<nom>/
├── data/
│   ├── models/          # Modèles Freezed (miroir des DTOs backend)
│   ├── services/         # Appels Dio bruts
│   ├── repositories/      # Gestion des erreurs, logique au-dessus des services
│   └── providers/          # Câblage Riverpod (DI)
└── presentation/
    ├── screens/          # Écrans
    ├── providers/         # Providers de présentation (état UI, recherche...)
    └── controllers/        # Contrôleurs d'actions (si nécessaire)
```

## Commandes utiles

```bash
flutter pub get                                              # dépendances
dart run build_runner build --delete-conflicting-outputs      # génération de code
flutter clean                                                    # nécessaire après modification d'AndroidManifest.xml
```

## Variables d'environnement : récapitulatif

| Variable | Description |
|---|---|
| `API_BASE_URL` | URL de base de l'API backend |

## Notes de configuration native

- **Android** : permissions déclarées dans `android/app/src/main/AndroidManifest.xml` (localisation, notifications, caméra) + bloc `<queries>` requis pour l'ouverture de WhatsApp sur Android 11+
- **iOS** : descriptions d'usage requises dans `ios/Runner/Info.plist` (localisation, caméra, photos)