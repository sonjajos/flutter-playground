import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/utilities/routes.dart';

class FooterMenuItem {
  IconData icon;
  String routeName;

  FooterMenuItem(this.icon, this.routeName);
}

List<FooterMenuItem> footerItems = [
  FooterMenuItem(Icons.search, homeScreen),
  FooterMenuItem(Icons.home, homeScreen),
  FooterMenuItem(Icons.person, homeScreen),
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      onTap: (value) {
        switch (value) {
          case 0:
            {
              if (ModalRoute.of(context)?.settings.name != homeScreen) {
                Navigator.pushNamed(context, homeScreen);
              }
            }
            break;
          default:
            {
              if (ModalRoute.of(context)?.settings.name != profileScreen) {
                Navigator.pushNamed(context, profileScreen);
              }
            }
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Scrolls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Forms',
        ),
      ],
    );
  }
}
