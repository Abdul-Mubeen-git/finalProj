import 'package:flutter/material.dart';
import 'package:app0703/widget/shapesitem.dart';

class ColumnDesignPage extends StatelessWidget {
  final String text1 = 'Column Design';
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const ColumnDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Column Design',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(95, 158, 160, 1),
      ),
      body: Container(
        alignment: Alignment.center,
        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 140,
                  width: 140,
                  child: TextButton(
                    onPressed: () => ShapesItem(context, 0),
                    child: const Text('CIRCLE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: changeStyle(r: 100.0),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 140,
                  width: 140,
                  child: TextButton(
                    onPressed: () => ShapesItem(context, 1),
                    child: const Text(
                      'SQUARE',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: changeStyle(r: 6),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 75,
              width: 300,
              child: TextButton(onPressed: () => ShapesItem(context, 2), child: const Text('RECTANGLE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), style: changeStyle(r: 10)),
            ),
          ],
        ),
      ),
    );
  }

  changeStyle({required double r}) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      shadowColor: MaterialStateProperty.all(const Color.fromRGBO(42, 223, 230, 1)),
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(45, 223, 230, 0.4)),
      foregroundColor: MaterialStateProperty.all(
        const Color.fromRGBO(95, 158, 160, 1),
      ),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r),
          side: const BorderSide(
            width: 1,
            color: Color.fromRGBO(95, 158, 160, 0.8),
          ))),
    );
  }
}
