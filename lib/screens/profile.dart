import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      bottomNavigationBar: const Footer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back to Home'),
          ),
        ),
      ),
    );
  }
}
