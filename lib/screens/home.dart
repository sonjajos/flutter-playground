import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/widgets/live_grid.dart';

import '../widgets/footer.dart';
import '../widgets/interactive_grid.dart';
import '../widgets/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double gridHeight = MediaQuery.of(context).size.width - 16;

    return Scaffold(
      drawer: const Menu(),
      bottomNavigationBar: const Footer(),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black,
        child: NestedScrollView(
          physics: const ScrollPhysics(),
          body: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  'Vertical Interactive Grid Scroll',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Container(
                height: gridHeight,
                color: Colors.black,
                child: const InteractiveGrid(elementsNum: 8),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  'Horizontal Interactive Grid Scroll',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Container(
                height: gridHeight,
                color: Colors.black,
                child: const InteractiveGrid(
                  elementsNum: 8,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  'Live Color Changing Grid',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Container(
                height: gridHeight,
                color: Colors.black,
                child: const LiveGrid(
                  elementsNum: 4,
                ),
              ),
            ],
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: 0,
                forceElevated: false,
                backgroundColor: Colors.blue,
              ),
            ];
          },
        ),
      ),
    );
  }
}
