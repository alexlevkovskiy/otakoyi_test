import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/styles.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _selectedItem1;
  String _selectedItem2;
  String _selectedItem3;

  List<String> _dataForDropDown = [
    'All areas',
    'Some data',
    'Another text',
    'Fourth item'
  ];

  bool _isHolderVisible = true;
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
                        filled: true,
                        fillColor: Colors.white,
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
                    _dropDownList('Area of practices', 0),
                    _dropDownList('Type of cases', 1),
                    _dropDownList('State', 2),
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
                              filled: true,
                              fillColor: Colors.white,
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
                              filled: true,
                              fillColor: Colors.white,
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
                        onPressed: (() {
                          setState(() {
                            _isHolderVisible = false;
                          });
                        }),
                        padding: const EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        child: Text(
                          "Apply filter",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            emptyView(),
            listViewItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: Icon(Icons.add),
          backgroundColor: NotificationColors.success,
          onPressed: () {
            setState(() {
              _isHolderVisible = false;
            });
          }),
    );
  }

  Widget listViewItem() {
    return Visibility(
      visible: !_isHolderVisible,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
              child: Text(
                'John Smith | Smith Law Firm',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Row(
              children: [
                goldButton('Bidders:', '0'),
                goldButton('Interviews:', '0'),
              ],
            ),
            Text(
              'Feugiat, occaecati arcu magna explicabo cons ectetur tempore quos fugiat dolorasperna tur varius, gravida quas, autem consectetur hic  faucibus nesciunt, arcu consectetu raute...',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              children: [
                goldButton('', 'Auto accidence'),
                grayButton(Icons.location_on, 'Los Angeles Country, CA')
              ],
            ),
            Row(
              children: [
                grayButton(Icons.ac_unit, 'Los Angeles Country, CA'),
                grayButton(Icons.calendar_today, 'Sep 19, 2019')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                columnData(
                    ['Min referal fee', '30%', 'Posted', 'September 19, 2019']),
                columnData([
                  'Area of practice',
                  'Personal Injury',
                  'Represented',
                  'Palintiff'
                ])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 10,
                  child: FlatButton(
                    onPressed: null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Edit',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: SurfaceColors.mediumGray,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 10,
                  child: FlatButton(
                    onPressed: null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Delete',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: NotificationColors.error,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            ),
            Divider(
              color: SurfaceColors.darkBlue,
            ),
          ],
        ),
      ),
    );
  }

  Widget columnData(List<String> texts) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: texts.map((e) {
          if (!texts.indexOf(e).isEven) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                e,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(e),
            );
          }
        }).toList(),
      ),
    );
  }

  Widget grayButton(IconData image, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FlatButton.icon(
        onPressed: null,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: SurfaceColors.mediumGray,
                width: 1,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
        icon: Icon(image),
        label: Text(
          value,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }

  Widget goldButton(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FlatButton(
        onPressed: null,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: SurfaceColors.gold, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Text(title),
            Text(
              " " + value,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }

  Widget emptyView() {
    return Visibility(
      visible: _isHolderVisible,
      child: Column(
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

  String _chooseSelectedItem(int index) {
    switch (index) {
      case 0:
        return _selectedItem1;
      case 1:
        return _selectedItem2;
      case 2:
        return _selectedItem3;
        break;
      default:
        return '';
    }
  }

  void _changeSelectedItem(int index, String newValue) {
    switch (index) {
      case 0:
        _selectedItem1 = newValue;
        break;
      case 1:
        _selectedItem2 = newValue;
        break;
      case 2:
        _selectedItem3 = newValue;
        break;
      default:
    }
  }

  Widget _dropDownList(String hint, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                filled: true,
                fillColor: SurfaceColors.white,
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: hint,
                labelText: hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            isEmpty: _chooseSelectedItem(index) == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _chooseSelectedItem(index),
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _changeSelectedItem(index, newValue);
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
