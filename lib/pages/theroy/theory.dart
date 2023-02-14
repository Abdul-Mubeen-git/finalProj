import 'selectedChapter.dart';
import 'package:flutter/material.dart';

class TheoryPage extends StatelessWidget {
  const TheoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Theory',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink[500],
        ),
        body: PageWithAnimatedList(),
      );
}

class PageWithAnimatedList extends StatefulWidget {
  @override
  _PageWithAnimatedListState createState() => _PageWithAnimatedListState();
}

class _PageWithAnimatedListState extends State<PageWithAnimatedList> {
  final _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() {
    final fetchedList = [
      items('\nIntroduction', '\nA small introduction to the theroy of RCC columns\n', 1),
      items('\nFundamental Concepts', '\nAxis, Loading and Classification of Columns\n', 2),
      items('\nDetailing Requirments (General)', '\nslenderness Limit and Minimum Eccetricities.', 3),
      items('\nLongitudinal Bar Detailing', '\nMinimum and Maximun (Longitudinal reinforcement,diameter,spacing and cover\n', 4),
      items('\nTransverse Bars Detailing', '\nMinimum and Maximum (transverse reinfrocment,diameter,pitch) and arrangement\n', 5),
      items('\nDesign for Axial Loading', '\nProcess of designing a short colum subjected to axial loads only\n', 6),
      items('\nDesign for Axial Load with Uni-axial bending', '\nProcess of designing a short column sbjected to axial loads and uni-axial bending moment\n', 7),
      items('\nDesign for Axial Load eith Bi-axial Bending', '\nprocess of designing a short column subjected to axial loads and bi-axial bending\n', 8),
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 150), () {
          _listItems.add(fetchedList[i]);
          _listKey.currentState?.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: _listKey,
        padding: const EdgeInsets.all(10),
        initialItemCount: _listItems.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: CurvedAnimation(
              curve: Curves.easeOut,
              parent: animation,
            ).drive((Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ))),
            child: _listItems[index],
          );
        },
      ),
    );
  }

  items(String title, sub, int index) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(sub),
        ),
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => selectedChapter(
                index: index,
                title: title,
              ))),
    );
  }
}
