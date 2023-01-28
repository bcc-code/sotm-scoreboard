import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordScreen extends HookWidget {
  const PasswordScreen({super.key, required this.onSubmit});

  final void Function(String password) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg_tile.jpg',
                filterQuality: FilterQuality.high,
                repeat: ImageRepeat.repeat,
                scale: 1),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                onSubmitted: onSubmit,
              ),
            ),
          )
        ],
      ),
    );
  }
}
