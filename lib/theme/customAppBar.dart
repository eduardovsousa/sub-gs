// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: const Color.fromRGBO(255, 50, 99, 1),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}