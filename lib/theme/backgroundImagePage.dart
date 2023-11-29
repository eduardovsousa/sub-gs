// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BackgroundImagePage extends StatelessWidget {
  final Widget child;

  const BackgroundImagePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}