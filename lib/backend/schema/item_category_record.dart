import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCategoryRecord extends FirestoreRecord {
  ItemCategoryRecord._(
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

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _categoryId = snapshotData['categoryId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itemCategory');

  static Stream<ItemCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemCategoryRecord.fromSnapshot(s));

  static Future<ItemCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemCategoryRecord.fromSnapshot(s));

  static ItemCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemCategoryRecordData({
  String? id,
  String? name,
  String? description,
  String? imageUrl,
  String? categoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemCategoryRecordDocumentEquality
    implements Equality<ItemCategoryRecord> {
  const ItemCategoryRecordDocumentEquality();

  @override
  bool equals(ItemCategoryRecord? e1, ItemCategoryRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.categoryId == e2?.categoryId;
  }

  @override
  int hash(ItemCategoryRecord? e) => const ListEquality()
      .hash([e?.id, e?.name, e?.description, e?.imageUrl, e?.categoryId]);

  @override
  bool isValidKey(Object? o) => o is ItemCategoryRecord;
}
