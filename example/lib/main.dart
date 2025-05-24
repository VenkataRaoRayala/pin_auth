import 'package:flutter/material.dart';
import 'package:pin_auth_flutter/pin_auth.dart';

void main() {
  runApp(MaterialApp(
    home: PinAuthScreen(
      onSuccess: () => print("PIN correct"),
      onFailure: () => print("PIN incorrect"),
    ),
  ));
}