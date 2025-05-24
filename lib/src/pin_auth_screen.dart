import 'package:flutter/material.dart';
import 'pin_auth_service.dart';

class PinAuthScreen extends StatefulWidget {
  final void Function()? onSuccess;
  final void Function()? onFailure;

  const PinAuthScreen({super.key, this.onSuccess, this.onFailure});

  @override
  State<PinAuthScreen> createState() => _PinAuthScreenState();
}

class _PinAuthScreenState extends State<PinAuthScreen> {
  final _controller = TextEditingController();
  final _authService = PinAuthService();

  void _checkPin() async {
    final success = await _authService.verifyPin(_controller.text);
    if (success) {
      widget.onSuccess?.call();
    } else {
      widget.onFailure?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect PIN')),
      );
    }
  }

  void _tryBiometric() async {
    final success = await _authService.authenticateWithBiometrics();
    if (success) {
      widget.onSuccess?.call();
    } else {
      widget.onFailure?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Biometric auth failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter PIN")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 6,
                decoration: const InputDecoration(labelText: 'Enter PIN'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkPin,
                child: const Text('Verify'),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.fingerprint),
                label: const Text('Use Biometric'),
                onPressed: _tryBiometric,
              ),
            ],
          ),
        ),
      ),
    );
  }
}