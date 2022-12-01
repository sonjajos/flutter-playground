import 'package:flutter/material.dart';

import '../utilities/helpers.dart';

class GridElement {
  String id;
  String text;
  Color color;

  GridElement(this.id, this.text, this.color);
}

List<GridElement> generateElements(int numOfElements) {
  return List<GridElement>.generate(
    numOfElements,
    (i) => GridElement(
      i.toString(),
      '$i',
      genRandomColor(),
    ),
  );
}

// This widget updates color of clicked box
class InteractiveGrid extends StatefulWidget {
  const InteractiveGrid(
      {required this.elementsNum,
      this.scrollDirection = Axis.vertical,
      super.key});

  final int elementsNum;
  final Axis scrollDirection;

  @override
  State<InteractiveGrid> createState() => _InteractiveGridState();
}

class _InteractiveGridState extends State<InteractiveGrid> {
  late List<GridElement> elements = generateElements(widget.elementsNum);

  @override
  Widget build(BuildContext context) {
    void updateElementColor(GridElement element) {
      setState(() {
        elements[elements.indexWhere((item) => item.id == element.id)].color =
            genRandomColor();
      });
    }

    bool isDesktopMode = MediaQuery.of(context).size.width > 700;

    return Container(
      color: Colors.black,
      child: Center(
        child: GridView.count(
          primary: false,
          scrollDirection: widget.scrollDirection,
          physics: const PageScrollPhysics(),
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: isDesktopMode ? 10 : 2,
          children: [
            ...elements.map(
              (element) => GestureDetector(
                onTap: () => updateElementColor(element),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: element.color,
                  alignment: Alignment.center,
                  child: Text(
                    element.text,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
