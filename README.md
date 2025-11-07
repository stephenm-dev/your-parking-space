# IP Lookup App

## 🚀 Run the App
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## 🧪 Run Tests
```bash
flutter test
```

## 🧩 Notes on Testing and Next Steps

**Tests not yet implemented:**
1. **Bloc tests**
   - Use `bloc_test` to verify correct state transitions:
     - `Loading → Success` when data is fetched.
     - `Loading → Failure` when an exception occurs.
   
2. **E2E tests**
   - Simulate user input for entering IP addresses and pressing "Lookup".
   - Verify that UI reacts correctly to Bloc states:
     - Displays a progress indicator during loading.
     - Shows error messages on failure.
     - Updates the map and details on success.
