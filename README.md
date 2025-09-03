# e_commerce_app

# Architecture

This project follows a Clean Architecture + Feature-first structure for scalability and maintainability.

lib/
│
├── core/                   # Core reusable modules
│   ├── routing/            # App-wide routing configuration (GoRouter)
│   ├── services/           # API clients and service classes (e.g., ProductService)
│   └── utils/              # Shared utilities (dialogs, decrement handler, etc.)
│
├── domain/                 # Domain & data layer
│   ├── data/               # Repository and data handling
│   │   ├── dao/            # Drift DAO for database operations
│   │   └── models/         # Domain models (CartItem, Product.)
│   └── database/           # Drift database setup (tables, schema, migrations)
│
├── features/               # Feature-first structure
│   ├── cart/               # Cart module (providers, screens, repo, widgets)
│   ├── home/               # Home/Product listing (providers, screens, widgets)
│   └── product/            # Product detail feature (providers, screens, widgets and repo)
│
├── generated/              # Auto-generated code for localization
│   └── *.g.dart            
│
├── l10n/                   # Localization files
│   └── *.arb               # Flutter Intl translations (English, Spanish)
│
└── main.dart               # App entry point (ProviderScope, GoRouter, Theme, Intl)


The app uses modern Flutter ecosystem libraries for state management, persistence, navigation, and localization.

# State Management

flutter_riverpod
 – Modern, safe, and testable state management.

riverpod_annotation
 – Annotation-based Riverpod code generation for cleaner providers.

build_runner
 – Generates provider boilerplate, Freezed models, JSON serialization.

# Data & Persistence

drift
 – Local persistence for cart (SQLite wrapper with type safety).

drift_dev
 – Code generation for Drift DAOs and tables.

sqlite3_flutter_libs
 – Native SQLite runtime for Drift.

# REST API integration (https://fakestoreapi.com/products).

 - dio

# Code Generation & Models

freezed
 – Data classes, union types, immutability.

json_serializable
 – JSON encode/decode for API models.

json_annotation
 – Annotations for JSON serialization.

# Navigation

go_router
 – Declarative routing and deep linking.

# Localization

intl
 – Internationalization and currency/date formatting.

flutter_localizations
 – IntelliJ/VSCode plugin for generating localization (S.of(context)).



# UI & UX Enhancements

confetti
 – Fun confetti animation when items are added to cart.

Material 3 Widgets – For modern UI styling and dark mode.

# Why these packages

Riverpod – Safer and more robust than Provider, avoids context misuse.

Drift – Type-safe persistence, better suited for relational data like cart items.

GoRouter – Cleaner navigation handling than Navigator 1.0, supports deep links easily.

Freezed + JsonSerializable – Eliminates boilerplate, ensures immutability.

Intl – Handles multiple languages and locale-aware formatting.

Confetti – Improves UX with smooth animations when adding items.


# How to Run the app 

- clone repository
- install the dependency by running 

 flutter pub get
- Generate code by running 
 dart run build_runner build 

- for change the device theme for app theme change 
- change the device Language to "Spanish" for Language change 

- For adding new locale 
 run Flutter Intl: Add Locale 

 add the corresponding .arb file , then save it and run 
 # dart run build_runner build  