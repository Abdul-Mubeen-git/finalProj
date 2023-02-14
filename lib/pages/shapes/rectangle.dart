import 'package:app0703/pages/rectCal.dart';
import 'package:flutter/material.dart';
//import 'package:app0703/pages/inputs.dart';

class RectanglePage extends StatelessWidget {
  const RectanglePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            pinned: true,
            backgroundColor: Color.fromRGBO(95, 158, 160, 1),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Recatangle Column Design',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: inputBox(),
          ),
        ],
      ));
}
