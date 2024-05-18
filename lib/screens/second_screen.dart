import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Que terror'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: Text('Go to Home Screen'),
        ),
      ),
    );
  }
}
