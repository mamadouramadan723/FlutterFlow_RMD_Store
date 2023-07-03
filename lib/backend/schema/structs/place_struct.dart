// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceStruct extends FFFirebaseStruct {
  PlaceStruct({
    LatLng? latLng,
    String? name,
    String? adress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latLng = latLng,
        _name = name,
        _adress = adress,
        super(firestoreUtilData);

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  set latLng(LatLng? val) => _latLng = val;
  bool hasLatLng() => _latLng != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  set adress(String? val) => _adress = val;
  bool hasAdress() => _adress != null;

  static PlaceStruct fromMap(Map<String, dynamic> data) => PlaceStruct(
        latLng: data['latLng'] as LatLng?,
        name: data['name'] as String?,
        adress: data['adress'] as String?,
      );

  static PlaceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlaceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'latLng': _latLng,
        'name': _name,
        'adress': _adress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latLng': serializeParam(
          _latLng,
          ParamType.LatLng,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'adress': serializeParam(
          _adress,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaceStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceStruct(
        latLng: deserializeParam(
          data['latLng'],
          ParamType.LatLng,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        adress: deserializeParam(
          data['adress'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlaceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceStruct &&
        latLng == other.latLng &&
        name == other.name &&
        adress == other.adress;
  }

  @override
  int get hashCode => const ListEquality().hash([latLng, name, adress]);
}

PlaceStruct createPlaceStruct({
  LatLng? latLng,
  String? name,
  String? adress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceStruct(
      latLng: latLng,
      name: name,
      adress: adress,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceStruct? updatePlaceStruct(
  PlaceStruct? place, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    place
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceStructData(
  Map<String, dynamic> firestoreData,
  PlaceStruct? place,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (place == null) {
    return;
  }
  if (place.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && place.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeData = getPlaceFirestoreData(place, forFieldValue);
  final nestedData = placeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = place.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceFirestoreData(
  PlaceStruct? place, [
  bool forFieldValue = false,
]) {
  if (place == null) {
    return {};
  }
  final firestoreData = mapToFirestore(place.toMap());

  // Add any Firestore field values
  place.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceListFirestoreData(
  List<PlaceStruct>? places,
) =>
    places?.map((e) => getPlaceFirestoreData(e, true)).toList() ?? [];
