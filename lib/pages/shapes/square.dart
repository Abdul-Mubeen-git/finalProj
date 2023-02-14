import 'package:app0703/pages/sqCal.dart';
import 'package:flutter/material.dart';

class SquarePage extends StatelessWidget {
  const SquarePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        clipBehavior: Clip.hardEdge,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            pinned: true,
            backgroundColor: Color.fromRGBO(95, 158, 160, 1),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Square Column Design',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: inputBox(),
          ),
        ],
      ));
}
