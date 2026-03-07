import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Credits')),
      body: const Center(
        child: Text(
          'Credits content will be implemented next.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
