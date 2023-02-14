import 'package:flutter/material.dart';

class columnGraphs extends StatefulWidget {
  bool isCir = false;
  columnGraphs({Key? key, required this.isCir}) : super(key: key);

  @override
  State<columnGraphs> createState() => _columnGraphsState();
}

class _columnGraphsState extends State<columnGraphs> {
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
                        case "Fy = 250 and d'/D = 0.05":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/250_0.05.png') : const AssetImage('assets/graphs/sr/250_0.05.png');
                          });
                          break;
                        case "Fy = 250 and d'/D = 0.10":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/250_0.10.png') : const AssetImage('assets/graphs/sr/250_0.10.png');
                          });
                          break;
                        case "Fy = 250 and d'/D = 0.15":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/250_0.15.png') : const AssetImage('assets/graphs/sr/250_0.15.png');
                          });
                          break;
                        case "Fy = 250 and d'/D = 0.20":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/250_0.20.png') : const AssetImage('assets/graphs/sr/250_0.20.png');
                          });
                          break;
                        case "Fy = 415 and d'/D = 0.05":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/415_0.05.png') : const AssetImage('assets/graphs/sr/415_0.05.png');
                          });
                          break;
                        case "Fy = 415 and d'/D = 0.10":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/415_0.10.png') : const AssetImage('assets/graphs/sr/415_0.10.png');
                          });
                          break;
                        case "Fy = 415 and d'/D = 0.15":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/415_0.15.png') : const AssetImage('assets/graphs/sr/415_0.15.png');
                          });
                          break;
                        case "Fy = 415 and d'/D = 0.20":
                          setState(() {
                            img = (widget.isCir) ? const AssetImage('assets/graphs/c/415_0.20.png') : const AssetImage('assets/graphs/sr/415_0.20.png');
                          });
                          break;
                      }
                    },
                    items: [
                      "Fy = 250 and d'/D = 0.05",
                      "Fy = 250 and d'/D = 0.10",
                      "Fy = 250 and d'/D = 0,15",
                      "Fy = 250 and d'/D = 0.20",
                      "Fy = 415 and d'/D = 0.05",
                      "Fy = 415 and d'/D = 0,10",
                      "Fy = 415 and d'/D = 0.15",
                      "Fy = 415 and d'/D = 0.20"
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
                    "Please select the Requried Graph from Above",
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
