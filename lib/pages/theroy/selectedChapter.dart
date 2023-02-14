import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class selectedChapter extends StatefulWidget {
  final String title;
  final int index;
  const selectedChapter({Key? key, required this.title, required this.index}) : super(key: key);

  @override
  State<selectedChapter> createState() => _selectedChapterState();
}

class _selectedChapterState extends State<selectedChapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title + "\n",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.justify,
          ),
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: items[index].title.toString() == ""
                            ? null
                            : Text(
                                "\n" + items[index].title.toString() + "\n",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                                textAlign: TextAlign.center,
                              ),
                        subtitle: Text(
                          "\n\      " + items[index].dis.toString() + "\n",
                          style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.blue),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/theroy/${widget.index}.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}

class ProductDataModel {
  //data Type
  String? title;
  String? dis;

// constructor
  ProductDataModel({this.title, this.dis});

  //method that assign values to respective datatype vairables
  ProductDataModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    dis = json["description"];
  }
}
