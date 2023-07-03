import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubCategoryRecord extends FirestoreRecord {
  SubCategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "itemCategoryId" field.
  String? _itemCategoryId;
  String get itemCategoryId => _itemCategoryId ?? '';
  bool hasItemCategoryId() => _itemCategoryId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _itemCategoryId = snapshotData['itemCategoryId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subCategory');

  static Stream<SubCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubCategoryRecord.fromSnapshot(s));

  static Future<SubCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubCategoryRecord.fromSnapshot(s));

  static SubCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubCategoryRecordData({
  String? id,
  String? name,
  String? description,
  String? imageUrl,
  String? itemCategoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'itemCategoryId': itemCategoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubCategoryRecordDocumentEquality implements Equality<SubCategoryRecord> {
  const SubCategoryRecordDocumentEquality();

  @override
  bool equals(SubCategoryRecord? e1, SubCategoryRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.itemCategoryId == e2?.itemCategoryId;
  }

  @override
  int hash(SubCategoryRecord? e) => const ListEquality()
      .hash([e?.id, e?.name, e?.description, e?.imageUrl, e?.itemCategoryId]);

  @override
  bool isValidKey(Object? o) => o is SubCategoryRecord;
}
