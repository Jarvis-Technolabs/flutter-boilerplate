**Flutter version**
```
3.7.12
```

**Clean Architecture**

Architecture is divided into 3 layers:

A) **Data**: Takes care of how data will be fetched. 
- Data source
- Entities/Data models
- Repositories implementation

B) **Domain**: Takes care of core business logic and provides data repositories. It is unaware of core implementation of how data is fetched.
- Repositories
- Usecases

C) **Presentation**: Takes care of presenting data using blocs.
- Bloc
- Screen - UI
- Widgets

**References:**
- <ins>Clean Architecture</ins>: https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/
- <ins>State management</ins>: Bloc - https://bloclibrary.dev/#/gettingstarted


**Generate files**

```
flutter pub run build_runner build --delete-conflicting-outputs
```

**Build Android Staging Release**

```
flutter build apk --release --flavor staging -t lib/core/flavour/main_staging.dart
```

**Build iOS Staging Release**

```
flutter build ios --release --flavor staging -t lib/core/flavour/main_staging.dart
```

**Build Android Production Release**

```
flutter build apk --release --flavor staging -t lib/core/flavour/main_prod.dart
```

**Build iOS Production Release**

```
flutter build ios --release --flavor staging -t ib/core/flavour/main_prod.dart
```
