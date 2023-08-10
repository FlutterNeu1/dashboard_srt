import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }

  List<String> _time = [
    '1 am',
    '2 am',
    '3 am',
    '4 am',
    '5 am',
    '6 am',
    '7am',
    '8 am',
    '9 am',
    '10 am'
  ];
  List<String> get time => _time;
  set time(List<String> _value) {
    _time = _value;
  }

  void addToTime(String _value) {
    _time.add(_value);
  }

  void removeFromTime(String _value) {
    _time.remove(_value);
  }

  void removeAtIndexFromTime(int _index) {
    _time.removeAt(_index);
  }

  void updateTimeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _time[_index] = updateFn(_time[_index]);
  }

  List<int> _Xaxis = [1, 2, 3, 4, 5];
  List<int> get Xaxis => _Xaxis;
  set Xaxis(List<int> _value) {
    _Xaxis = _value;
  }

  void addToXaxis(int _value) {
    _Xaxis.add(_value);
  }

  void removeFromXaxis(int _value) {
    _Xaxis.remove(_value);
  }

  void removeAtIndexFromXaxis(int _index) {
    _Xaxis.removeAt(_index);
  }

  void updateXaxisAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _Xaxis[_index] = updateFn(_Xaxis[_index]);
  }

  List<int> _Yaxis = [1, 2, 3, 4, 5];
  List<int> get Yaxis => _Yaxis;
  set Yaxis(List<int> _value) {
    _Yaxis = _value;
  }

  void addToYaxis(int _value) {
    _Yaxis.add(_value);
  }

  void removeFromYaxis(int _value) {
    _Yaxis.remove(_value);
  }

  void removeAtIndexFromYaxis(int _index) {
    _Yaxis.removeAt(_index);
  }

  void updateYaxisAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _Yaxis[_index] = updateFn(_Yaxis[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
