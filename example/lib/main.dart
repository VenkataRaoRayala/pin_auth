import 'package:flutter/material.dart';
import 'package:pin_auth/pin_auth.dart';

void main() {
  runApp(MaterialApp(
    home: PinAuthScreen(
      onSuccess: () => print("PIN correct"),
      onFailure: () => print("PIN incorrect"),
    ),
  ));
}