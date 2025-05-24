# pin_auth

A Flutter plugin for secure PIN-based authentication with optional biometric fallback.

## Features

- Secure PIN storage using flutter_secure_storage
- PIN verification UI
- Biometric login (fingerprint, face ID) using local_auth

## Getting Started

```dart
PinAuthScreen(
  onSuccess: () => print("Success!"),
  onFailure: () => print("Failure!"),
);
```