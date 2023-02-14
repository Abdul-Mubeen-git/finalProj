import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../graph.dart';
import 'msgStyle.dart';

double pi = 3.141592653589793;

class circle extends StatefulWidget {
  const circle({Key? key}) : super(key: key);

  @override
  State<circle> createState() => _circleState();
}

class _circleState extends State<circle> {
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
                  'Circular Column Design',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: circleInput(),
            ),
          ],
        ));
  }
}

class circleInput extends StatefulWidget {
  const circleInput({Key? key}) : super(key: key);

  @override
  State<circleInput> createState() => _circleInputState();
}

class _circleInputState extends State<circleInput> {
  final ScrollController _scrollController = ScrollController();
  double? _n, dia, d;
  int temp = 0;
  int? n;
  bool submit = false;
  final _pu_t = TextEditingController();
  final _mux = TextEditingController();
  final _muy = TextEditingController();
  var _D = TextEditingController();
  final _b = TextEditingController();
  final _p = TextEditingController();
  final _l = TextEditingController();
  final _efc = TextEditingController();
  final _nb = TextEditingController();
  final _pitch = TextEditingController();
  final _cc = TextEditingController();
  double _el = 0.0,
      ag = 0.0,
      _pu = 0.0,
      emin = 0.0,
      ex = 0,
      ey = 0,
      e = 0.0,
      _as = 0,
      _ac = 0,
      _asmin = 0,
      _cdmax = 0,
      _ptmin = 0,
      _asmax = 0,
      _acc = 0,
      _cd = 0,
      _arc = 0,
      _vc = 0,
      _vu = 0,
      _vus = 0,
      _rhr = 0,
      _vusr = 0,
      _diat = 6,
      _pltf = 0,
      aspc = 0,
      scb = 0,
      efcd = 0,
      _x = 0,
      _y = 0;
  String? _selectedfy, t1, t2, _selectedend, esc, _selectedbarDia, _selectedfck;
  bool _switch = false, _isshort = false, _refreshed = false;

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
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
          children: <Widget>[
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              controller: _pu_t,
              decoration: const InputDecoration(labelText: 'Enter the Factored Load'),
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Enter the Moument (Mux)'),
              controller: _mux,
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Enter the Moument(Muy)'),
              controller: _muy,
            ),
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
            BodyWidget(),
            TextField(
              controller: _l,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Enter the unsupported Length (l)'),
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Enter the End Condition',
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  ),
                  isEmpty: _selectedend == null,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedend,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedend = newValue;
                          state.didChange(newValue);
                        });

                        switch (_selectedend) {
                          case 'Against Rotaion in both ends':
                            _el = 0.65 * double.parse(_l.text);
                            break;
                          case 'Against rotation at one end':
                            _el = 0.8 * double.parse(_l.text);
                            break;
                          case 'Not restrined aginst rotation':
                            _el = 1 * double.parse(_l.text);
                            break;
                          case 'Held in postion':
                            _el = 1.2 * double.parse(_l.text);
                            break;
                          case 'Partially restrain':
                            _el = 1.5 * double.parse(_l.text);
                            break;
                          case 'Not held in position':
                            _el = 2 * double.parse(_l.text);
                            break;
                          case 'Not restrained':
                            _el = 2 * double.parse(_l.text);
                            break;
                        }
                      },
                      items: [
                        'Against Rotaion in both ends',
                        'Against rotation at one end',
                        'Not restrained against rotation',
                        'Held in postion',
                        'Partially restrain',
                        'Not held in position',
                        'Not restrained'
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
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autocorrect: false,
              decoration: const InputDecoration(labelText: "Effective cover (d')"),
              controller: _efc,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  highlightColor: Colors.red.shade300,
                  onTap: () {
                    _selectedfck = null;
                    _selectedfy = null;
                    _selectedend = null;
                  },
                  child: Container(
                    color: Colors.white10,
                    child: const Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: submit == false
                  ? errorStyle('Please Enter the values Above ', Alignment.center, 1)
                  : SingleChildScrollView(
                      child: Column(
                        // shrinkWrap: true,
                        children: [
                          resultStyle('Effective Length (le) = $_el \nGross Area (Ag) = $ag \nFactored Load (Pu) = $_pu\nDiameter(D) = ${_D.text} ', Alignment.centerLeft, 1),
                          Center(
                              child: _isshort == true
                                  ? Column(
                                      children: [
                                        resultStyle(
                                            '\n>> Short Column <<\n\n >> Eccentricity check << \n\n Minimum Eccentricity (emin) = $emin\n Eccentricity (e) = $e \n\n>> $esc <<', Alignment.center, 0.6),
                                        resultStyle(
                                            '\nArea of steel Requried (As) = $_as\nArea of Concrete (Ac) = $_ac\nMinimum Area of steel Requried (As_min) = $_asmin\n Maximum Area of steel Requried (As_max) = $_asmax\n',
                                            Alignment.center,
                                            0.6),
                                        columnGraphs(isCir: true),
                                        Container(
                                            child: ((_as > _asmin) && (_as < _asmax))
                                                ? Container(
                                                    child: (_as > 0)
                                                        ? FormField<String>(
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
                                                                        _selectedbarDia = newValue;
                                                                        state.didChange(newValue);
                                                                      });
                                                                      if (_selectedbarDia == newValue) {
                                                                        setState(() {
                                                                          _refreshed = true;
                                                                        });
                                                                      }
                                                                      dia = double.parse(_selectedbarDia.toString());
                                                                      if (_refreshed) {
                                                                        setState(() {
                                                                          _n = (_as) / ((pi / 4) * (dia! * dia!));
                                                                          temp = _n!.ceil();
                                                                          if (temp % 2 != 0) {
                                                                            temp = temp + 1;
                                                                          } else {
                                                                            temp = temp;
                                                                          }
                                                                          _n = temp as double;
                                                                        });
                                                                      }
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
                                                          )
                                                        : errorStyle('Area of Steel Requried should be grater than 0', Alignment.center, 1))
                                                : errorStyle("Area of Steel Requried should be in between AS minmum and maximum", Alignment.center, 1)),
                                        Center(
                                          child: (temp < 6)
                                              ? errorStyle(" \nNumber of Bars = $temp\nMinimum Number of Bars Should be Greater than 4 \nPlease Change Bar Dia \n", Alignment.centerLeft, 1)
                                              : isSafe(),
                                        ),
                                      ],
                                    )
                                  : errorStyle("Ratio is grater than 12 Hence it's Long column", Alignment.center, 1))
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    var form = formkey.currentState;
    _pu = (double.parse(_pu_t.text) * 1000);
    if (_switch == false) {
      setState(() {
        ag = _pu / ((0.42) * (double.parse(_selectedfck.toString()) * ((100 - double.parse(_p.text)) / 100) + (0.70358 * double.parse(_selectedfy.toString()) * (double.parse(_p.text) / 100))));
        double d = (ag * 4) / pi;
        d = sqrt(d);
        int temp = d as int;
        while (temp % 10 != 0) {
          temp = temp + 1;
        }
        d = temp.toDouble();
      });
    } else {
      ag = (pi / 4) * double.parse(_D.text) * double.parse(_D.text);
    }

    if (form!.validate()) {
      form.save();
      setState(() {
        submit = true;
        emin = 0.05 * double.parse(_D.text);
      });
    }
    double _check = _el / double.parse(_D.text);
    if (_check < 12.0) {
      setState(() {
        //short column
        _isshort = true;
        e = (double.parse(_l.text)) / 500 + (double.parse(_D.text)) / 30;
        // Axially loaded
        if (e <= emin) {
          setState(() {
            esc = 'Column is Axially loaded';
            _as = (_pu - 0.42 * double.parse(_selectedfck.toString()) * ag) / ((0.7035 * double.parse(_selectedfy.toString())) - (0.42 * double.parse(_selectedfck.toString())));
            _ac = (ag - _as);
            _asmin = 0.008 * ag;
            _asmax = 0.04 * ag;
          });
        } else if (e > emin) {
          setState(() {
            esc = 'Column is Bi-axially loaded';
            efcd = double.parse(_efc.text) / double.parse(_D.text);
            if (efcd <= 0.05) {
              efcd = 0.05;
            } else if (efcd > 0.05 && efcd <= 0.1) {
              efcd = 0.1;
            } else if (efcd > 0.1 && efcd <= 0.15) {
              efcd = 0.15;
            } else {
              efcd = 0.2;
            }
            double b = double.parse(_b.text), d = double.parse(_D.text);
            _x = double.parse(_mux.text) / b * d * d;
            _y = _pu / (double.parse(_selectedfck.toString()) * b * d);
          });
        } else {
          setState(() {
            esc = ' check once';
          });
        }
      });
    } else {
      //long column
      setState(() {
        _isshort = false;
      });
    }
  }

  Column BodyWidget() {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(95, 158, 160, 0.6),
          child: SwitchListTile(
              activeColor: const Color.fromRGBO(95, 158, 160, 1),
              onChanged: (bool value) {
                setState(() {
                  _switch = !_switch;
                });
              },
              value: _switch,
              title: const Text('Assume')),
        ),
        Container(
          child: customview(),
        ),
      ],
    );
  }

  Widget customview() {
    switch (_switch) {
      case (false):
        return getWith();
      case (true):
        return getWithout();
    }
    return getWith();
  }

  Widget getWithout() {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      autocorrect: false,
      decoration: const InputDecoration(labelText: 'Enter the Diameter (d)'),
      controller: _D,
    );
  }

  Widget getWith() {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      autocorrect: false,
      decoration: const InputDecoration(labelText: 'Enter the Assumed % of steel'),
      controller: _p,
    );
  }

  isSafe() {
    setState(() {
      aspc = (pi / 4) * (dia! * dia! * temp);
    });
    return SingleChildScrollView(
      child: Column(children: [
        resultStyle('Number of Bars are  =  $temp', Alignment.center, 1),
        resultStyle(' min no of bar in circular column is grater then 6 so this is  safe', Alignment.center, 0.6),
        resultStyle('Area of Steel Provided $aspc', Alignment.center, 0.6),
        Center(child: ((aspc >= _asmin) && (aspc <= _asmax)) ? isSafeGA() : errorStyle('Section is not Safe by Gross Area', Alignment.center, 1))
      ]),
    );
  }

  isSafeGA() {
    return SingleChildScrollView(
      child: Column(
        children: [
          resultStyle('Section is  Safe by Gross Area', Alignment.center, 0.6),
          const SizedBox(
            height: 5,
          ),
          resultStyle('Spacing Check', Alignment.center, 1),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            autocorrect: false,
            decoration: const InputDecoration(labelText: 'Assume Clear Cover'),
            controller: _cc,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  double _diatc = (1 / 4) * dia!;
                  _diat = 6;
                  if (_diatc > _diat) {
                    _diat = _diatc;
                  }
                  int temp_diat = _diat.ceil();
                  while ((temp_diat % 2 != 0) && (temp_diat < 13)) {
                    temp_diat = temp_diat + 1;
                  }
                  _diat = temp_diat.toDouble();

                  _cd = d! - (2 * double.parse(_cc.text));

                  _cdmax = _cd / 6;
                  _ptmin = 3 * _diat;
                });
                _acc = (pi / 4) * (_cd * _cd);
                _arc = _acc - aspc;
                _vc = _arc * double.parse(_pitch.text);
                _vu = pi * (_cd - _diat);
                _vus = (pi / 4) * (_diat * _diat) * _vu;
                _rhr = 0.36 * ((ag / _arc) - 1) * (double.parse(_selectedfck.toString()) / double.parse(_selectedfy.toString()));
                _vusr = _vus / _vc;
              },
              child: const Text('Evaluate')),
          Container(child: (_diat != 0) ? designLateralTies() : Text('data'))
        ],
      ),
    );
  }

  customMinimumSpacing() {}

  designLateralTies() {
    return Column(
      children: [
        const Text(''),
        resultStyle('Design of Helical Reinforcement', Alignment.center, 1),
        resultStyle('size of Helical Reinforcment = $_diat', Alignment.center, 0.6),
        resultStyle('Pitch Max values 75 and cdmax = $_cdmax', Alignment.center, 0.6),
        resultStyle('Pitch min values 25 and cdmax = $_ptmin', Alignment.center, 0.6),
        const Text(''),
        resultStyle('Select pitch of herical reinforment between minmum and maximum values from above', Alignment.center, 0.6),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          autocorrect: false,
          decoration: const InputDecoration(labelText: 'Pitch of herical Reinforcment'),
          controller: _pitch,
        ),
        resultStyle('Volume of core per pitch height = $_vc', Alignment.center, 0.6),
        resultStyle('Volume of one herical reinforcment = $_vus', Alignment.center, 0.6),
        Container(child: (_vusr < _rhr) ? resultStyle("section is Safe", Alignment.center, 1) : errorStyle('Section is not safe', Alignment.center, 1)),
      ],
    );
  }
}
// resultStyle(
//               'Area of Steel Provided (Asp) = $aspc', Alignment.center, 0.6),
