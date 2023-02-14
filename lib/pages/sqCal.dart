import 'package:app0703/pages/graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'alertPage.dart' as alert;
import 'msgStyle.dart';

class inputBox extends StatefulWidget {
  const inputBox({Key? key}) : super(key: key);

  @override
  State<inputBox> createState() => _inputBoxState();
}

class _inputBoxState extends State<inputBox> {
  final ScrollController _scrollController = ScrollController();
  double? _n, dia;
  int temp = 0;
  int? n;
  bool submit = false, _isbi = false;
  final _pu_t = TextEditingController();
  final _mux = TextEditingController();
  final _muy = TextEditingController();
  var _D = TextEditingController();
  final _b = TextEditingController();
  final _p = TextEditingController();
  final _l = TextEditingController();
  final _efc = TextEditingController();
  final _nb = TextEditingController();
  final _nd = TextEditingController();
  final _cc = TextEditingController();
  final _smux1 = TextEditingController();
  final _gpsfck = TextEditingController();

  double _el = 0.0,
      _gps = 0,
      _actp = 0,
      _agpsfck = 0,
      _mux1 = 0,
      _muy1 = 0,
      _puz = 0,
      _ppuz = 0,
      _alphan = 0,
      _ir = 0,
      ag = 0.0,
      _pu = 0.0,
      exmin = 0.0,
      eymin = 0.0,
      ex = 0,
      ey = 0,
      _as = 0,
      _ac = 0,
      _asmin = 0,
      _asmax = 0,
      _asp1 = 0,
      _pi = 3.141592653589793,
      _sb = 0,
      _sd = 0,
      _sbc = 0,
      _sdc = 0,
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
                          resultStyle(
                              'Effective Length (le) = $_el \nGross Area (Ag) = $ag \nFactored Load (Pu) = $_pu\n Width (b) = ' + _b.text + '\nDepth (D) = ' + _D.text, Alignment.centerLeft, 1),
                          Center(
                              child: _isshort == true
                                  ? Column(
                                      children: [
                                        resultStyle(
                                            '\n>> Short Column <<\n\n >> Eccentricity check << \n\n Minimum Eccentricity in X direction (ex_minmum) = $exmin \n Minimum Eccentricity in y direction (ey_minmum) = $eymin \n Eccentricity in X direction (ex) = $ex \n Eccentricity in Y direction (ey) $ey\n >> $esc <<',
                                            Alignment.center,
                                            0.6),
                                        Container(
                                          child: (_isbi)
                                              ? Column(
                                                  children: [
                                                    resultStyle("select fy = $_selectedfy d'/D = $efcd Graph ", Alignment.center, 1),
                                                    resultStyle('X = $_x Y = $_y', Alignment.center, 1),
                                                    columnGraphs(isCir: false),
                                                    TextFormField(
                                                      validator: (str) {
                                                        (str!.isEmpty) ? 'enter the valid input' : null;
                                                      },
                                                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                                                      ],
                                                      autocorrect: false,
                                                      decoration: const InputDecoration(labelText: "Enter the gps/fck from graph"),
                                                      controller: _gpsfck,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          //gps=gpsfck*fck;
                                                          _gps = double.parse(_gpsfck.text) * double.parse(_selectedfck.toString());
                                                          _as = (_gps / 100) * (double.parse(_b.text) * double.parse(_D.text));
                                                          _ac = double.parse(_b.text) * double.parse(_D.text) - _as;
                                                          _asmin = 0.008 * double.parse(_b.text) * double.parse(_D.text);
                                                          _asmax = 0.06 * double.parse(_b.text) * double.parse(_D.text);
                                                        },
                                                        icon: const Icon(Icons.refresh)),
                                                    resultStyle(' Percentage of Steel = $_gps', Alignment.center, 0.6),
                                                  ],
                                                )
                                              : null,
                                        ),
                                        resultStyle(
                                            '\nArea of steel Requried (As) = $_as\nArea of Concrete (Ac) = $_ac\nMinimum Area of steel Requried (As_min) = $_asmin\n Maximum Area of steel Requried (As_max) = $_asmax\n',
                                            Alignment.center,
                                            0.6),
                                        Container(
                                            child: (_as > 0)
                                                ? Container(
                                                    child: FormField<String>(
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
                                                    ),
                                                  )
                                                : errorStyle('Area of Steel Requried should be grater than 0', Alignment.center, 1)),
                                        Center(
                                          child: (temp <= 4)
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
        ag = _pu / ((0.4) * (double.parse(_selectedfck.toString())) * ((100 - (double.parse(_p.text))) / 100) + (0.67 * (double.parse(_selectedfy.toString())) * ((double.parse(_p.text) / 100))));

        ag = sqrt(ag);
        ag.ceil();
        int ag1 = ag.toInt();
        while (ag1 % 10 != 0) {
          ag1 = ag1 + 1;
        }
        _b.text = ag1.toString();
        _D.text = ag1.toString();
        ag = ag * ag;
      });
    } else {
      _D = _b;
      ag = (double.parse(_b.text)) * (double.parse(_D.text));
    }

    if (form!.validate()) {
      form.save();
      setState(() {
        submit = true;
        exmin = 0.05 * double.parse(_D.text);
        eymin = 0.05 * double.parse(_b.text);
      });
    }
    double _check = _el / (double.parse(_D.text));
    double _check1 = _el / (double.parse(_b.text));
    if (_check < 12.0 || _check1 < 12.0) {
      setState(() {
        //short column
        _isshort = true;
        ex = (double.parse(_l.text)) / 500 + (double.parse(_D.text)) / 30;
        ey = (double.parse(_l.text)) / 500 + (double.parse(_b.text)) / 30;
        // Axially loaded
        if ((ex < exmin) && (ey < eymin)) {
          setState(() {
            esc = 'Column is Axially loaded';
            _as = (_pu - 0.4 * (double.parse(_selectedfck.toString()) * (double.parse(_b.text) * (double.parse(_D.text))))) /
                ((0.67 * (double.parse(_selectedfy.toString()))) - (0.4 * (double.parse(_selectedfck.toString()))));
            _ac = ((double.parse(_b.text)) * (double.parse(_D.text)) - _as);
            _asmin = 0.008 * (double.parse(_b.text)) * (double.parse(_D.text));
            _asmax = 0.06 * (double.parse(_b.text)) * (double.parse(_D.text));
          });
        } else if ((ex >= exmin) && (ey >= eymin)) {
          setState(() {
            _isbi = true;
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
    return Column(
      children: [
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          autocorrect: false,
          decoration: const InputDecoration(labelText: 'Enter the Width (b)'),
          controller: _b,
        ),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          autocorrect: false,
          decoration: const InputDecoration(labelText: 'Enter the Depth'),
          controller: _b,
        ),
      ],
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
        resultStyle(' min no of bars in square column are grater than 4 so this is  safe', Alignment.center, 0.6),
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
            decoration: const InputDecoration(labelText: 'Enter no of Bars by width (for one side) '),
            controller: _nb,
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            autocorrect: false,
            decoration: const InputDecoration(labelText: 'Enter no of Bars by depth (for one side)'),
            controller: _nd,
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            autocorrect: false,
            decoration: const InputDecoration(labelText: 'Enter the Clear Cover'),
            controller: _cc,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _sb = ((double.parse(_b.text)) - 2 * (double.parse(_cc.text)) - (double.parse(_nb.text)) * (double.parse(_selectedbarDia.toString()))) / ((double.parse(_nb.text)) - 1);
                  _sd = ((double.parse(_D.text)) - 2 * (double.parse(_cc.text)) - (double.parse(_nd.text)) * (double.parse(_selectedbarDia.toString()))) / ((double.parse(_nd.text)) - 1);

                  int sbtemp = _sb.ceil(), sdtemp = _sd.ceil();
                  while (sbtemp % 10 != 0) {
                    sbtemp = sbtemp + 1;
                  }
                  while (sdtemp % 10 != 0) {
                    sdtemp = sdtemp + 1;
                  }
                  _sb = sbtemp.toDouble();
                  _sd = sdtemp.toDouble();
                  double _diatc = (1 / 4) * dia!;
                  if (_diatc > _diat) {
                    _diat = _diatc;
                  }
                  int temp_diat = _diat.ceil();
                  while ((temp_diat % 2 != 0) && (temp_diat < 13)) {
                    temp_diat = temp_diat + 1;
                  }
                  // _diat = temp_diat.toDouble();

                  double _plt1 = 16 * dia!, _plt2 = (double.parse(_b.text)), _plt3 = 300;
                  if ((_plt1 <= _plt2) && (_plt1 <= _plt3)) {
                    _pltf = _plt1;
                  } else if (_plt2 < _plt3) {
                    _pltf = _plt2;
                  } else {
                    _pltf = _plt3;
                  }
                });
                setState(() {
                  _sbc = (double.parse(_b.text) - 2 * double.parse(_efc.text)) / (double.parse(_nb.text) - 1);
                  scb = (double.parse(_D.text) - (2 * double.parse(_efc.text)));
                  _actp = (aspc / (double.parse(_b.text) * double.parse(_D.text))) * 100;
                  _agpsfck = _actp / double.parse(_selectedfck.toString());
                });
              },
              child: const Text('Evaluate')),
          Container(
              child: ((_sb <= 40) || (_sd <= 40))
                  ? errorStyle('Spacing Should be Greater than or equal to 40 mm \nSpacing Along Width = $_sb\nSpacing Along Depth = $_sd', Alignment.center, 1)
                  : designLateralTies())
        ],
      ),
    );
  }

  customMinimumSpacing() {}

  designLateralTies() {
    return Column(
      children: [
        resultStyle('Section is Safe by Spacing', Alignment.center, 1),
        Container(
            child: (_isbi)
                ? Column(
                    children: [
                      resultStyle('Actual Percentage of steel = $_actp', Alignment.center, .6),
                      resultStyle('Actual p/fck vlaue = $_agpsfck', Alignment.center, .6),
                      resultStyle('Value of Y = $_y', Alignment.center, .6),
                      resultStyle("Value of fy = $_selectedfy Value of d'/d = $efcd ", Alignment.center, 0.6),
                      Container(child: (_isbi) ? resultStyle("d'/b = $efcd", Alignment.center, .6) : null),
                      columnGraphs(isCir: false),
                      TextField(
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        autocorrect: false,
                        decoration: const InputDecoration(labelText: "Enter the value of mux / fck * b * d *d"),
                        controller: _smux1,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _mux1 = double.parse(_smux1.text) * double.parse(_selectedfck.toString()) * double.parse(_b.text) * double.parse(_D.text) * double.parse(_D.text);
                              _mux1 = _mux1 / 1000000;
                              _muy1 = _mux1;
                              _puz = ((0.45 * double.parse(_selectedfck.toString()) * _ac) + (0.75 * double.parse(_selectedfy.toString()) * aspc));
                              _ppuz = _pu / _puz;
                              if (_ppuz < 0.2) {
                                _alphan = 1;
                              } else if (_ppuz > 0.8) {
                                _alphan = 2;
                              } else if (_ppuz >= 0.2 && _ppuz < 0.8) {
                                _alphan = 1 + ((_ppuz - 0.2) / 0.6);
                              }
                              _ir = pow((double.parse(_mux.text) / _mux1), _alphan) + pow((double.parse(_muy.text) / _muy1), _alphan) as double;
                            });
                          },
                          child: const Text("proceed")),
                      resultStyle("Value mux1 = $_mux1 and $_muy1", Alignment.center, 0.6),
                      resultStyle("alphan Value = $_alphan", Alignment.center, 0.6),
                      resultStyle("checking the Interaction Ratio", Alignment.center, 1),
                      resultStyle("value of IR = $_ir", Alignment.center, 1),
                      Container(
                        child: (_ir < 1)
                            ? resultStyle("section is Safe by Interation ratio", Alignment.center, 1)
                            : errorStyle("section is not safe by interation ration\n ignore after this error", Alignment.center, 1),
                      )
                    ],
                  )
                : null),
        resultStyle('Spacing Along Width = $_sb\nSpacing Along Depth = $_sd', Alignment.center, 1),
        const Text(''),
        resultStyle('Design of Lateral Ties', Alignment.center, 1),
        resultStyle('Diameter of Lateral Ties = $_diat', Alignment.center, 0.6),
        const Text(''),
        resultStyle('Pitch of Lateral Ties', Alignment.center, 1),
        resultStyle('Pitch of lateral ties shall not exceed = $_pltf', Alignment.center, 0.6),
        const Text(''),
        resultStyle('Extra Strriup Check', Alignment.center, 1),
        Container(
          child: (_sbc > 75)
              ? Column(
                  children: [
                    resultStyle('spacing between bars = $_sbc', Alignment.center, 0.6),
                    resultStyle('Value Greater than 75 So Extra Stirrup Requried', Alignment.center, 0.6),
                    resultStyle('Type of Stirrup', Alignment.center, 1),
                    resultStyle('Spacing between corner bars = $scb', Alignment.center, 0.6),
                    Center(
                      child: (scb > (48 * _diat))
                          ? resultStyle('Value less than 48 times dia of Lateral tie so Provide open Stirrup', Alignment.center, 0.6)
                          : resultStyle('Value greater than 48 times dia of Lateral tie so Provide closed Stirrup', Alignment.center, 0.6),
                    )
                  ],
                )
              : resultStyle('Value less than 75 No Need of Extra Stirrup', Alignment.center, 1),
        )
      ],
    );
  }
}
// resultStyle(
//               'Area of Steel Provided (Asp) = $aspc', Alignment.center, 0.6),
