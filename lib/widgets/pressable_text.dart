import 'package:flutter/material.dart';

class PressableText extends StatelessWidget {
  const PressableText({required this.text, required this.onTap, super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.arrow_right,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
