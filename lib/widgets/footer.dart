import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_first_flutter_app/screens/home.dart';
import 'package:my_first_flutter_app/screens/profile.dart';
import 'package:my_first_flutter_app/screens/recipies.dart';
import 'package:my_first_flutter_app/store/navigation.dart';

List<Widget> screens = [
  const HomeScreen(),
  const ProfileScreen(),
  const RecipiesScreen(),
];

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State createState() {
    return FooterState();
  }
}

class FooterState extends State<Footer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: customNav.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Scrolls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Forms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Recipies',
          ),
        ],
        onTap: (int index) {
          customNav.selectTab(index);
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => screens[index],
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
    );
  }
}
