import 'package:flutter/material.dart';
import 'widget/navigationDrawerWidget.dart';
import 'widget/widgetbutton.dart';
import 'widget/selecteditem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String title = 'CB Design';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CB Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CB Design'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white10),
          child: const NavigationDrawerWidget(),
        ),
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            ButtonWidget(icon: Icons.view_column_rounded, text: 'Column Design', onClicked: () => SelectedItem(context, 0)),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(icon: Icons.design_services_rounded, text: 'Beam Design', onClicked: () => SelectedItem(context, 1)),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(icon: Icons.book_rounded, text: 'Theory', onClicked: () => SelectedItem(context, 2)),
          ]),
        ),
      );
}
