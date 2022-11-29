import 'package:flutter/material.dart';
import 'dart:math' as math;

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
            const Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: null,
                icon: Icon(
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

const gridElements = [
  "First elem",
  "Second elem",
  "Third elem",
  "Fourth elem",
  "Fifth elem",
  "Sixth elem",
  "Seventh elem",
  "Eighth elem",
  "Ninth elem",
];

class MiddleContent extends StatelessWidget {
  const MiddleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ...gridElements.map((element) => Container(
                  padding: const EdgeInsets.all(8),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  child:
                      Text(element, style: Theme.of(context).textTheme.caption),
                ))
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  // runApp(const WelcomeText(username: "sonjajos"));
  runApp(MaterialApp(
    title: "My First App",
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      textTheme: const TextTheme(
        caption: TextStyle(
            color: Colors.white, fontSize: 20, decoration: TextDecoration.none),
      ),
    ),
    home: Container(
      color: Colors.black,
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black,
                transformAlignment: Alignment.topLeft,
                child: const Expanded(child: Header(name: "Sonja")),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                  transformAlignment: Alignment.bottomRight,
                  child: const Expanded(child: MiddleContent()),
                ),
              ),
              Container(
                color: Colors.black,
                transformAlignment: Alignment.bottomRight,
                child: const Expanded(child: Footer()),
              ),
            ]),
      ),
    ),
  ));
}
