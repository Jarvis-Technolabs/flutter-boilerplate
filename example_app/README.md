**Flutter version**
```
 - 3.16.9
```

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