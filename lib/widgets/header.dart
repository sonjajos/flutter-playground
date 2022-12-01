import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () => {Navigator.pushNamed(context, '/profile')},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
