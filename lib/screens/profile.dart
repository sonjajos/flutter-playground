import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/menu.dart';
import '../widgets/profile_form.dart';

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
        child: const Center(
          child: ProfileForm(),
        ),
      ),
    );
  }
}
