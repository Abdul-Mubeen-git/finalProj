// ignore_for_file: file_names, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'selecteditem.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  // ignore: non_constant_identifier_names
  final AssetImage = 'assets/image/bg.jpg';

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue.withOpacity(0.9),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            buildHeader(text: ''),
            const Divider(
              color: Colors.white70,
              thickness: 1.0,
            ),
            const Text(
              'Design of Column and Beams',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(
              color: Colors.white70,
              thickness: 1.0,
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: 'column Design', icon: Icons.view_column_rounded, onClicked: () => SelectedItem(context, 0)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: 'Beam Design', icon: Icons.design_services_rounded, onClicked: () => SelectedItem(context, 1)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: 'Theory', icon: Icons.book_rounded, onClicked: () => SelectedItem(context, 2)),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.white70,
              thickness: 1.0,
            ),
            buildMenuItem(text: 'About Us', icon: Icons.people_outlined, onClicked: () => SelectedItem(context, 3)),
            Container(alignment: Alignment.bottomLeft, child: buildMenuItem(text: 'Exit', icon: Icons.power_settings_new_rounded, onClicked: () => exit(0))),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({required String text}) {
    const color = Colors.black87;
    return DrawerHeader(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: new DecorationImage(image: new ExactAssetImage(AssetImage), fit: BoxFit.cover),
          color: Colors.blue,
        ),
        child: const Text(
          '',
          style: TextStyle(
            color: color,
            fontSize: 20,
          ),
        ));
  }

  Widget buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
