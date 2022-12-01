import 'package:flutter/material.dart';
import 'dart:async';

import '../utilities/helpers.dart';

class LiveGridElement {
  String id;
  String text;
  Color color;

  LiveGridElement(this.id, this.text, this.color);
}

List<LiveGridElement> generateElements(int numOfElements) {
  return List<LiveGridElement>.generate(
    numOfElements,
    (i) => LiveGridElement(
      i.toString(),
      '$i',
      genRandomColor(),
    ),
  );
}

// This widget updates color of next box in grid every second
class LiveGrid extends StatefulWidget {
  const LiveGrid({required this.elementsNum, super.key});

  final int elementsNum;

  @override
  State<LiveGrid> createState() => _LiveGridState();
}

class _LiveGridState extends State<LiveGrid> {
  late List<LiveGridElement> elements = generateElements(widget.elementsNum);
  int activeElementIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (mounted)
                {
                  setState(() {
                    elements[activeElementIndex].color = genRandomColor();
                    activeElementIndex =
                        activeElementIndex == widget.elementsNum - 1
                            ? 0
                            : activeElementIndex + 1;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          children: [
            ...elements.map(
              (element) => Container(
                padding: const EdgeInsets.all(8),
                color: element.color,
                alignment: Alignment.center,
                child: Text(
                  element.text,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
