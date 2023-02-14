import 'package:flutter/material.dart';

resultStyle(String text, Alignment align, double opc) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: align,
    width: double.infinity,
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    color: Color.fromRGBO(95, 158, 160, opc),
  );
}

errorStyle(String text, Alignment align, double opc) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: align,
    width: double.infinity,
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    color: Color.fromRGBO(219, 45, 33, opc),
  );
}
