import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app0703/pages/msgStyle.dart';
import 'tableRe.dart';

// ignore: camel_case_types
class beamPage extends StatelessWidget {
  const beamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                  'Beams Design',
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
}

double pi = 3.141592653589793;

// ignore: camel_case_types
class inputBox extends StatefulWidget {
  const inputBox({Key? key}) : super(key: key);

  @override
  State<inputBox> createState() => _inputBoxState();
}

class _inputBoxState extends State<inputBox> {
  int temp = 0, n = 0;
  final ScrollController _scrollController = ScrollController();
  var D = TextEditingController();
  final b = TextEditingController();
  final ct = TextEditingController();
  final mu = TextEditingController();
  final dt = TextEditingController();
  final pt = TextEditingController();
  final pc = TextEditingController();
  final nob = TextEditingController();
  final nod = TextEditingController();
  final cc = TextEditingController();
  final vu = TextEditingController();
  final tc = TextEditingController();

  double _efcd = 0,
      _mulimit = 0,
      _mubd = 0,
      _ast = 0,
      _asc = 0,
      _pd = 0,
      _n = 0,
      _asp = 0,
      _aspt = 0,
      _asmin = 0,
      _asmax = 0,
      _asmint = 0,
      _asmaxt = 0,
      _sb = 0,
      _sd = 0,
      _mor = 0,
      _tv = 0,
      _asv = 0,
      _sv = 0,
      _svmax = 0,
      _vuc = 0,
      _vus = 0,
      _efd = 0;
  double? _pt;
  String? _selectedfy, txt, _selectedstl, _selectedfck, _selectedbarDia, _selectedstd;
  bool _submit = false;
  int check = 0;

  final formkey = GlobalKey<FormState>();
  final ckey = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scrollbar(
        isAlwaysShown: true,
        thickness: 9,
        showTrackOnHover: true,
        interactive: true,
        radius: const Radius.circular(50),
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          padding: const EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 20),
          children: <Widget>[
            resultStyle("Cross-Section", Alignment.center, 1),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Enter the Width (b)'),
              controller: b,
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Enter the depth (d)'),
              controller: D,
            ),
            resultStyle("Material Properties", Alignment.center, 1),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'fck value',
                  ),
                  isEmpty: _selectedfck == null,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedfck,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedfck = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: ['20', '25'].map((String value) {
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
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'fy value',
                  ),
                  isEmpty: _selectedfy == null,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedfy,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedfy = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: ['250', '415'].map((String value) {
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
            resultStyle("effective Cover", Alignment.center, 1),
            TextField(
              controller: dt,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: "Enter the Tesion Cover(d't)"),
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: "Comp.Cover(d'c)"),
              controller: ct,
            ),
            resultStyle("Design for Flexure", Alignment.center, 1),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: "Factored Moment (mu)"),
              controller: mu,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: (_submit == false)
                  ? errorStyle("please enter the vlaues ", Alignment.center, 1)
                  : Column(
                      children: [
                        resultStyle("$txt", Alignment.center, 1),
                        resultStyle("efcd value = $_efcd", Alignment.center, .6),
                        resultStyle("Value of mulimit = $_mulimit", Alignment.center, .6),
                        resultStyle("Value of mubd = $_mubd", Alignment.center, .6),
                        resultStyle("Value of fy = $_selectedfy", Alignment.center, .6),
                        resultStyle("Value of efd = $_efd", Alignment.center, .6),
                        const beamsTable(),
                        TextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
                          ],
                          autocorrect: false,
                          decoration: const InputDecoration(labelText: "Enter the % of tension steel by fy,mubd,efd"),
                          controller: pt,
                        ),
                        (txt == "Doubly Reinforced Beam")
                            ? TextField(
                                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
                                ],
                                autocorrect: false,
                                decoration: const InputDecoration(labelText: "Enter the % of compression steel by fy,mubd"),
                                controller: pc,
                              )
                            : const Text(""),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _ast = (double.parse(pt.text) / 100) * ((double.parse(b.text) * _efcd));
                              });
                            },
                            child: const Text("proceed")),
                        Container(child: (_ast == 0) ? null : goNext1()),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    var form = formkey.currentState;

    setState(() {
      if (form!.validate()) {
        _submit = true;
      } else {
        _submit = false;
      }
    });
    setState(() {
      _efcd = double.parse(D.text) - double.parse(dt.text);
    });
    if (int.parse(_selectedfy.toString()) == 250) {
      setState(() {
        _mulimit = 0.148 * double.parse(_selectedfck.toString()) * double.parse(b.text) * (_efcd * _efcd);
      });
    } else if (int.parse(_selectedfy.toString()) == 415) {
      setState(() {
        _mulimit = 0.138 * double.parse(_selectedfck.toString()) * double.parse(b.text) * (_efcd * _efcd);
      });
    }
    setState(() {
      _mulimit = _mulimit / 1000000;
    });
    if (double.parse(mu.text) < _mulimit) {
      setState(() {
        txt = "Singly Reinforced Beam";
        _mubd = double.parse(mu.text) * 1000000 / (double.parse(b.text) * (_efcd * _efcd));
      });
    } else {
      setState(() {
        txt = "Doubly Reinforced Beam";
        _mubd = double.parse(mu.text) * 1000000 / (double.parse(b.text) * (_efcd * _efcd));
        _efd = double.parse(dt.text) / double.parse(D.text);
        if (_efd <= 0.05) {
          _efd = 0.05;
        } else if (_efd > 0.05 && _efd <= 0.1) {
          _efd = 0.1;
        } else if (_efd > 0.1 && _efd <= 0.15) {
          _efd = 0.15;
        } else if (_efd >= 0.16) {
          _efd = 0.2;
        }
      });
    }
  }

  goNext1() {
    return Column(
      children: [
        resultStyle("value of ast = $_ast", Alignment.center, 1),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Select Bar Dia',
              ),
              isEmpty: _selectedbarDia == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedbarDia,
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      onPressed();
                      _selectedbarDia = newValue;
                      state.didChange(newValue);
                      _n = _ast / ((pi / 4) * (double.parse(_selectedbarDia.toString()) * double.parse(_selectedbarDia.toString())));
                    });
                    n = _n.ceil();
                    if (n % 2 != 0) {
                      n = n + 1;
                    } else {
                      n = n;
                    }
                    _asp = (pi / 4) * (double.parse(_selectedbarDia.toString()) * double.parse(_selectedbarDia.toString())) * n;
                    _asmin = (0.85 * double.parse(b.text) * _efcd) / double.parse(_selectedfy.toString());
                    _asmax = (0.04 * double.parse(b.text) * double.parse(D.text));
                    _tv = (double.parse(vu.text) * 1000) / (double.parse(b.text) * _efcd);
                  },
                  items: ['12', '16', '20', '25', '32'].map((String value) {
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
        resultStyle("Number of Bars = $n ", Alignment.center, 0.6),
        resultStyle("Value of asp = $_asp ", Alignment.center, 0.6),
        const SizedBox(height: 10),
        resultStyle("Minimum Tension Reinforcment", Alignment.center, 1),
        resultStyle("Value of asmin = $_asmin ", Alignment.center, 0.6),
        const SizedBox(height: 10),
        resultStyle("Maximum Tension Reinforcment", Alignment.center, 1),
        resultStyle("Value of asmax = $_asmax ", Alignment.center, 0.6),
        Container(child: (_asp > _asmin && _asp < _asmax) ? resultStyle("Section is Safe", Alignment.center, 1) : errorStyle("section is Not Safe", Alignment.center, 1)),
        const SizedBox(height: 10),
        resultStyle("Spacing", Alignment.center, 1),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          autocorrect: false,
          decoration: const InputDecoration(labelText: "Enter the no of Bars Width(One Side)"),
          controller: nob,
        ),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          autocorrect: false,
          decoration: const InputDecoration(labelText: "Enter the no of Bars depth(One Side)"),
          controller: nod,
        ),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          autocorrect: false,
          decoration: const InputDecoration(labelText: "Enter the Clear Cover"),
          controller: cc,
        ),
        ElevatedButton(
            onPressed: () {
              onPressed();
              setState(() {
                _sb = (double.parse(b.text) - 2 * double.parse(cc.text) - double.parse(nob.text) * double.parse(_selectedbarDia.toString())) / (double.parse(nob.text) - 1);
                _sd = (double.parse(D.text) - 2 * double.parse(cc.text) - double.parse(nod.text) * double.parse(_selectedbarDia.toString())) / (double.parse(nod.text) - 1);
              });
              setState(() {
                _mor = 0.87 *
                    double.parse(_selectedfy.toString()) *
                    _asp *
                    _efcd *
                    (1 - (double.parse(_selectedfy.toString()) * _asp) / (double.parse(_selectedfy.toString()) * double.parse(b.text) * double.parse(D.text)));
                _mor = _mor / 1000000;
              });
            },
            child: const Text("Proceed")),
        resultStyle("value of sb = $_sb ", Alignment.center, .6),
        resultStyle("value of sb = $_sd ", Alignment.center, .6),
        Container(
            child: ((_sd > 40) && (_sb > 40))
                ? goNext2()
                : errorStyle("Section is not Safe \n minimum spacing is equal or grater the 40 so change cross section or change Assumed Diameter", Alignment.center, 1)),
      ],
    );
  }

  goNext2() {
    return Column(
      children: [
        resultStyle("Section is Safe By Spacing", Alignment.center, 1),
        const SizedBox(height: 10),
        resultStyle("Caleculating the Mument of Resistence", Alignment.center, 1),
        resultStyle("value of Mor = $_mor ", Alignment.center, 1),
        Container(child: (double.parse(mu.text) < _mor) ? goNext3() : errorStyle("Section is Not Safe", Alignment.center, 1))
      ],
    );
  }

  goNext3() {
    setState(() {
      _pt = ((_asp) / (double.parse(b.text) * _efcd)) * 100;
    });
    return Column(children: [
      resultStyle("Section is Safe", Alignment.center, 1),
      const SizedBox(height: 10),
      resultStyle("Check For Shear", Alignment.center, 1),
      TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
        autocorrect: false,
        decoration: const InputDecoration(labelText: "Enter the factored Shear"),
        controller: vu,
      ),
      FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Select Setirrup Dia',
            ),
            isEmpty: _selectedstd == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedstd,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedstd = newValue;
                    state.didChange(newValue);
                    onPressed();
                  });
                },
                items: ['6', '8', '10'].map((String value) {
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
      FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Select no of Legs',
            ),
            isEmpty: _selectedstl == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedstl,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedstl = newValue;
                    state.didChange(newValue);
                  });
                },
                items: ['2', '4', '6'].map((String value) {
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
      resultStyle("Nominal Shear Stress = $_tv", Alignment.center, 1),
      resultStyle("Value of Pt = $_pt", Alignment.center, 1),
      resultStyle("Value of Fck = $_selectedfck", Alignment.center, 1),
      //diplay table indvidual
      InteractiveViewer(
        // clipBehavior: Clip.none,
        child: const Image(
          image: AssetImage('assets/tables/stb.png'),
          fit: BoxFit.cover,
        ),
      ),
      TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
        autocorrect: false,
        decoration: const InputDecoration(labelText: "Enter the Shear Strength of Concreate from Tabble 19"),
        controller: tc,
      ),
      ElevatedButton(
          onPressed: () {
            onPressed();
            if (_tv < double.parse(tc.text)) {
              setState(() {
                _asv = (pi / 4) * (double.parse(_selectedstd.toString()) * double.parse(_selectedstd.toString())) * double.parse(_selectedstl.toString());
                _sv = (_asv * 0.87 * double.parse(_selectedfy.toString())) / (0.4 * double.parse(b.text));
                _svmax = 0.75 * _efcd;
              });
            } else {
              setState(() {
                _vuc = double.parse(tc.text) * double.parse(b.text) * _efcd;
                _vus = ((double.parse(vu.text) * 1000) - _vuc);
                _asv = (pi / 4) * (double.parse(_selectedstd.toString()) * double.parse(_selectedstd.toString())) * double.parse(_selectedstl.toString());
                _sv = (0.87 * double.parse(_selectedfy.toString()) * _asv * _efcd) / (_vus);
                _svmax = 0.75 * _efcd;
              });
            }
          },
          child: const Text("Proceed")),
      (_asv != 0) ? resultStyle("Area of Sheared Reinforcement (asv) = $_asv", Alignment.center, 1) : const Text(""),
      const SizedBox(height: 10),
      (_sv != 0) ? resultStyle("Spacing of Sheared Reinforcment Shall be Less then or Equal to sv = $_sv", Alignment.center, 1) : const Text(""),
      const SizedBox(height: 10),
      (_svmax != 0) ? resultStyle("Maximum Spacing Sheared Requirment $_svmax", Alignment.center, 1) : const Text(""),
      (_vuc != 0) ? resultStyle("Shear Carried by Concreat = $_vuc", Alignment.center, 1) : const Text(""),
      (_vus != 0) ? resultStyle("Shear Carried by Stirrup", Alignment.center, 1) : const Text(""),
      Container(child: (_sv <= _svmax) ? resultStyle("Section is Safe", Alignment.center, 1) : errorStyle("Section is Not Safe", Alignment.center, 1))
    ]);
  }
}
