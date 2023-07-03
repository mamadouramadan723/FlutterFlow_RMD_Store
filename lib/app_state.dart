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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DocumentReference? _favoriteProd =
      FirebaseFirestore.instance.doc('/product/dummy');
  DocumentReference? get favoriteProd => _favoriteProd;
  set favoriteProd(DocumentReference? _value) {
    _favoriteProd = _value;
  }

  String _selectedCategory = '1';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String _value) {
    _selectedCategory = _value;
  }

  String _selectedItemCategory = '1';
  String get selectedItemCategory => _selectedItemCategory;
  set selectedItemCategory(String _value) {
    _selectedItemCategory = _value;
  }

  String _selectedSubCategory = '1';
  String get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(String _value) {
    _selectedSubCategory = _value;
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
