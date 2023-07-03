import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingRecord extends FirestoreRecord {
  RatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rate" field.
  RatingStruct? _rate;
  RatingStruct get rate => _rate ?? RatingStruct();
  bool hasRate() => _rate != null;

  void _initializeFields() {
    _rate = RatingStruct.maybeFromMap(snapshotData['rate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rating');

  static Stream<RatingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingRecord.fromSnapshot(s));

  static Future<RatingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingRecord.fromSnapshot(s));

  static RatingRecord fromSnapshot(DocumentSnapshot snapshot) => RatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingRecordData({
  RatingStruct? rate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rate': RatingStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "rate" field.
  addRatingStructData(firestoreData, rate, 'rate');

  return firestoreData;
}

class RatingRecordDocumentEquality implements Equality<RatingRecord> {
  const RatingRecordDocumentEquality();

  @override
  bool equals(RatingRecord? e1, RatingRecord? e2) {
    return e1?.rate == e2?.rate;
  }

  @override
  int hash(RatingRecord? e) => const ListEquality().hash([e?.rate]);

  @override
  bool isValidKey(Object? o) => o is RatingRecord;
}
