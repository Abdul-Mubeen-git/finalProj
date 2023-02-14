import 'package:flutter/material.dart';

class alertB extends StatelessWidget {
  final String? disc;
  const alertB({Key? key, required this.disc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showAlertDialog(context, disc),
    );
  }
}

showAlertDialog(BuildContext context, String? disc) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert"),
    content: Text(disc!),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
