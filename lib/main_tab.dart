import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/styles.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _selectedItem1;
  List<String> _dataForDropDown = [
    'All areas',
    'Some data',
    'Another text',
    'Fourth item'
  ];
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  TextEditingController lowerPercentageController = TextEditingController();
  TextEditingController upperPercentageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    lowerPercentageController.text = '0';
    upperPercentageController.text = '100';
  }

  @override
  void dispose() {
    super.dispose();
    lowerPercentageController.dispose();
    upperPercentageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                color: SurfaceColors.lightGray,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(15.0),
                  bottomRight: const Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Search for cases",
                        hintText: "Search for cases",
                        //  errorText:true ? 'Search query must be from 3 to 120 symbols' : null,
                        suffixIcon: Icon(
                          Icons.search,
                          color: SurfaceColors.gold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    _header('Filters'),
                    _dropDownList('Area of practices'),
                    _dropDownList('Type of cases'),
                    _dropDownList('State'),
                    Divider(
                      color: SurfaceColors.darkBlue,
                    ),
                    _header('Choose the rate'),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: lowerPercentageController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                double dValue = double.parse(value);
                                lowerPercentageController.text = value;
                                if (dValue <= _currentRangeValues.end &&
                                    dValue < 100.0)
                                  _currentRangeValues = RangeValues(
                                      double.parse(value),
                                      _currentRangeValues.end);
                              });
                            },
                            decoration: InputDecoration(
                              suffixText: '%',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              color: SurfaceColors.darkBlue,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: upperPercentageController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                double dValue = double.parse(value);
                                upperPercentageController.text = value;

                                if (dValue >= _currentRangeValues.start &&
                                    dValue < 100.0)
                                  _currentRangeValues = RangeValues(
                                      _currentRangeValues.start,
                                      double.parse(value));
                              });
                            },
                            decoration: InputDecoration(
                              suffixText: '%',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      activeColor: SurfaceColors.gold,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                          upperPercentageController.text =
                              values.end.toStringAsFixed(0);
                          lowerPercentageController.text =
                              values.start.toStringAsFixed(0);
                        });
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: SurfaceColors.darkBlue,
                        onPressed: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Asdasd",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Image.asset('images/holder.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Create your\nfirst case',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: Icon(Icons.add),
          backgroundColor: NotificationColors.success,
          onPressed: () {}),
    );
  }

  Widget _header(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _dropDownList(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                fillColor: SurfaceColors.white,
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: hint,
                labelText: hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            isEmpty: _selectedItem1 == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedItem1,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _selectedItem1 = newValue;
                    state.didChange(newValue);
                  });
                },
                items: _dataForDropDown.map((String value) {
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
    );
  }
}
