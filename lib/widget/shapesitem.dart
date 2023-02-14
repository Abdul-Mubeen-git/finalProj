// ignore_for_file: non_constant_identifier_names
import 'package:app0703/pages/shapes/circle.dart';
import 'package:app0703/pages/shapes/rectangle.dart';
import 'package:flutter/material.dart';
import 'package:app0703/pages/shapes/square.dart';

void ShapesItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const circle()));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SquarePage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const RectanglePage(),
      ));
      break;
  }
}
