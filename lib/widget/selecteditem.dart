import 'package:app0703/pages/columpage.dart';
import 'package:app0703/pages/aboutus.dart';
import 'package:app0703/beam/main.dart';
import 'package:app0703/pages/theroy/theory.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void SelectedItem(
  BuildContext context,
  int index,
) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ColumnDesignPage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const beamPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TheoryPage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AboutUsPage(),
      ));
      break;
  }
}
