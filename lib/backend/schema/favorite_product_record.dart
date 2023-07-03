import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoriteProductRecord extends FirestoreRecord {
  FavoriteProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favoriteProduct');

  static Stream<FavoriteProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteProductRecord.fromSnapshot(s));

  static Future<FavoriteProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteProductRecord.fromSnapshot(s));

  static FavoriteProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteProductRecordData({
  String? userId,
  DocumentReference? productRef,
  DateTime? creationDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'productRef': productRef,
      'creationDate': creationDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteProductRecordDocumentEquality
    implements Equality<FavoriteProductRecord> {
  const FavoriteProductRecordDocumentEquality();

  @override
  bool equals(FavoriteProductRecord? e1, FavoriteProductRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.productRef == e2?.productRef &&
        e1?.creationDate == e2?.creationDate;
  }

  @override
  int hash(FavoriteProductRecord? e) =>
      const ListEquality().hash([e?.userId, e?.productRef, e?.creationDate]);

  @override
  bool isValidKey(Object? o) => o is FavoriteProductRecord;
}
