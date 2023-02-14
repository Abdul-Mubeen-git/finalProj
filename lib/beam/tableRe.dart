import 'package:flutter/material.dart';

class beamsTable extends StatefulWidget {
  const beamsTable({Key? key}) : super(key: key);

  @override
  State<beamsTable> createState() => _beamsTableState();
}

class _beamsTableState extends State<beamsTable> {
  String? _selectedgraph;
  AssetImage? img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(95, 158, 160, 1),
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: const InputDecoration(
                  labelText: "Select the Graph",
                  icon: Icon(
                    Icons.add_chart_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                ),
                isEmpty: _selectedgraph == null,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedgraph,
                    isDense: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedgraph = newValue;
                        state.didChange(newValue);
                      });

                      switch (_selectedgraph) {
                        case "Fy = 250 and fck = 20":
                          setState(() {
                            img = const AssetImage('assets/tables/drpt/250_20.png');
                          });
                          break;
                        case "Fy = 250 and fck = 25":
                          setState(() {
                            img = const AssetImage('assets/tables/drpt/250_25.png');
                          });
                          break;
                        case "Fy = 415 and fck = 20":
                          setState(() {
                            img = const AssetImage('assets/tables/drpt/250_20.png');
                          });
                          break;
                        case "Fy = 415 and fck = 25":
                          setState(() {
                            img = const AssetImage('assets/tables/drpt/250_25.png');
                          });
                          break;
                        case "Fy = 20":
                          setState(() {
                            img = const AssetImage('assets/tables/drpt/20.png');
                          });
                          break;
                        case "Fy = 25":
                          setState(() {
                            img = const AssetImage('assets/tables/drpt/25.png');
                          });
                          break;
                      }
                    },
                    items: [
                      "Fy = 250 and fck = 20",
                      "Fy = 250 and fck = 25",
                      "Fy = 415 and fck = 20",
                      "Fy = 415 and fck = 25",
                      "Fy = 20",
                      "Fy = 25",
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
        Card(
          elevation: 20,
          // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
          child: _selectedgraph == null
              ? Container(
                  alignment: Alignment.center,
                  height: 450,
                  width: double.infinity,
                  color: const Color.fromRGBO(95, 158, 160, 0.2),
                  child: const Text(
                    "Please select the Requried Graph from Above values",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              : InteractiveViewer(
                  // clipBehavior: Clip.none,
                  child: Image(
                    image: img!,
                    fit: BoxFit.cover,
                  ),
                ),
        )
      ],
    );
  }
}
