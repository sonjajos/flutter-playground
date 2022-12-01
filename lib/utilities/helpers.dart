import 'package:flutter/material.dart';
import 'dart:math' as math;

Color genRandomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
